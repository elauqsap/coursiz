class HomeController < ApplicationController
	
  def index
  	if !user_signed_in?
  		redirect_to new_user_session_path
  	else
    	@users = current_user

    	@enrolled_classes = nil
    	
    end
  end

end