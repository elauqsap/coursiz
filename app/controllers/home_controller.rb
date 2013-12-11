class HomeController < ApplicationController

  before_filter do |c|
  	if !user_signed_in?
  		@users = User.all
  		redirect_to new_user_session_path
  	end
  end

  def index
  	if can? :admin, :all?
  		@tasks = AdminTask.fix_task
  	end
  end

  def complete
  	AdminTask.complete(params[:task])
  	redirect_to request.referrer
  end

end