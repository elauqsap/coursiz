class CategoriesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

	def index
    @cat = Category.all
  end

	def show
    @cat = Category.find_by_name(params[:id])
  end

  def new
    @cat = Category.new
    redirect_to root_path unless can? :admin, :all
  end

  def create
    @cat = params[:category]
    if !Category.find_by_name(@cat[:name]).blank?
      flash[:warning] = "#{@cat[:name]} already exists!"
      redirect_to new_category_path
    else
      Category.create!(params[:category])
      flash[:info] = "#{@cat[:name]} was added successfully!"
      redirect_to root_path
    end
  end

end
