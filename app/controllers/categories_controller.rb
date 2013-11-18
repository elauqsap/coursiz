class CategoriesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

	def index
    @cat = Category.all
  end

	def show
    @cat = Category.find_by_name(params[:id]) || ""
    if @cat.empty?
      flash[:warning] = "The category requested does not exist"
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
          @cat.errors.add(key,"#{val}")
        else
          @quiz.errors.add(key,"#{val}")
        end
      end
    end
  end

end
