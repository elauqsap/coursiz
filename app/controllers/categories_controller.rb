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
    @cat = Category.new
    redirect_to root_path unless can? :admin, :all
  end

  def create
    redirect_to root_path unless can? :admin, :all
    @name = Category.validator(params[:category])
    if !Category.find_by_name(@name).blank?
      flash[:warning] = "#{@name} already exists!"
      redirect_to new_category_path
    else
      Category.create!("name" => "#{@name}")
      flash[:notice] = "#{@name} was added successfully!"
      redirect_to root_path
    end
  end

end
