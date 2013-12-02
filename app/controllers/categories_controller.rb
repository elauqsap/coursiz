class CategoriesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!
helper_method :sort_column, :sort_direction

	def index
    # @cat = Category.all
    @cat = Category.order(sort_column + " " + sort_direction)
  end

	def show
    @cat = Category.find_by_name(params[:id])
    render :json => @cat if request.xhr?
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


  private
  
  def sort_column
    Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
