class HomeController < ApplicationController
	
  def index
  	if !user_signed_in?
  		redirect_to new_user_session_path
  	else
    	@users = User.all
    	@chart = Stat.create_chart(current_user.id)
    	
    end
  end

end