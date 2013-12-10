class HomeController < ApplicationController

  before_filter do |c|
  	if !user_signed_in?
  		@users = User.all
  		redirect_to new_user_session_path
  	end
  end

  def index
  	
  end

end