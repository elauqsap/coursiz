class CategoriesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!
helper_method :sort_column, :sort_direction

	def index
    @cat = Category.order(sort_column + " " + sort_direction)
  end

	def show
    @cat = Category.find_by_name(params[:id])
    if !@cat.nil?
      @catQuizzes = @cat.quizzes
      @cat2 = @catQuizzes.pluck(:difficulty).uniq
      @url_text = ["Beginning","Middle","End"]
      render :json => @catQuizzes if request.xhr?
    else
      redirect_to root_path
    end
  end

  def new
    redirect_to root_path unless can? :admin, :all
    redirect_to categories_manage_path
  end

  def create
    redirect_to root_path unless can? :admin, :all
    @real = params[:category]
    @name = Category.validator(params[:category])
    @cat = Category.new(:name => @name)
    if !@cat.valid?
      @cat.save
      redirect_to categories_manage_path(:errors => @cat.errors.messages) and return
    else
      Category.create!("name" => "#{@name}", "real_name" => "#{@real[:name]}")
      flash[:notice] = "#{@real[:name]} was added successfully!"
      redirect_to request.referer
    end
  end

  def manage
    redirect_to root_path unless can? :admin, :all
    @cat = Category.new
    @quiz = Quiz.new
    if !params[:errors].blank?
      params[:errors].each_pair do |key,val|
        if key.eql? "name"
          @cat.errors.add(key,val.join)
        else
          @quiz.errors.add(key,val.join)
        end
      end
    end
  end

  private
  
  def sort_column
    Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


end
