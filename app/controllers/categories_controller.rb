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
    @cat = Category.new
  end

  def create
    redirect_to root_path unless can? :admin, :all
    @real = params[:category]
    @name = Category.validator(params[:category])
    if @name.blank?
      flash[:warning] = "Category can't be blank!"
      redirect_to categories_manage_path and return
    end
    if !Category.find_by_name(@name).blank?
      flash[:warning] = "#{@real[:name]} already exists!"
      redirect_to categories_manage_path and return
    else
      Category.create!("name" => "#{@name}", "real_name" => "#{@real[:name]}")
      flash[:notice] = "#{@real[:name]} was added successfully!"
      redirect_to root_path
    end
  end

  def manage
    redirect_to root_path unless can? :admin, :all
    @cat = Category.new
    @quiz = Quiz.new
    if params[:errors].blank?
      @quiz = Quiz.new
    else
      @quiz = Quiz.new
      params[:errors].each_pair do |key,val|
        @quiz.errors.add(key,"#{val}")
      end
    end
  end

end
