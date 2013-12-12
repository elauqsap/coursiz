class HomeController < ApplicationController

  before_filter do |c|
  	if !user_signed_in?
  		@users = User.all
  		redirect_to new_user_session_path
  	else

    	
  	end
  end

  def index
  	if can? :admin, :all?
  		@tasks = AdminTask.fix_task
  	end
    @users = current_user
    
    if current_user.categories_enrolled.nil?

      current_user.categories_enrolled = Array.new
      current_user.save

    end

    @enrolled_categories = current_user.categories_enrolled


  end

  def complete
  	AdminTask.complete(params[:task])
  	redirect_to request.referrer
  end

  def support
    @task = AdminTask.new()
  end

  def add_task
    flash[:notice] = "Your request has been added"
    redirect_to request.referrer
  end



end