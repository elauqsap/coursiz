class CategoriesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

	def index
    @cat = Category.all
	end

	def show
    @cat = Category.find_by_name "#{params[:name]}"
  end

  def new
    :authenticate_admin!
  end

  def create
  end

end
