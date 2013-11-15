class CategoriesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

	def index
<<<<<<< HEAD
    @cat = Category.all
=======

		if !user_signed_in?
  			redirect_to new_user_session_path
  		else
    		@cat = Category.all
    	end
>>>>>>> 0353d18c1fad1b8a16f656224dbc96d48c17d3e3
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
