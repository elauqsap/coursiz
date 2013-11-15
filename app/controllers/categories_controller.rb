class CategoriesController < ApplicationController

	def index

		if !user_signed_in?
  			redirect_to new_user_session_path
  		else
    		@cat = Category.all
    	end
	end

	def show

    # @cat = Category.find(params[:category])
    @cat = Category.find_by_name "#{params[:name]}"

  end

end
