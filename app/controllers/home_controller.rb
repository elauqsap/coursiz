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
    @users = current_user
    if current_user.categories_enrolled.nil?
      current_user.categories_enrolled = Array.new
      current_user.save
    end

    @enrolled_categories = current_user.categories_enrolled

    @enrolled_categories_downcase = @enrolled_categories

    @enrolled_array = Array.new

    @enrolled_categories_downcase.each do |n|

      @enrolled_array <<  n.gsub(/\s+/, "").downcase
    end
  end

  def complete
  	AdminTask.complete(params[:task])
  	redirect_to request.referrer
  end

  def support
    @task = AdminTask.new
    if !params[:errors].blank?
      params[:errors].each_pair do |key,val|
          @task.errors.add(key,val.join)
      end
    end
  end

  def add_task
    @task = AdminTask.new(params[:admin_task])
    if !@task.valid?
      @task.save
      redirect_to support_path(:errors => @task.errors.messages) and return
    else
      @task.user_id = current_user.id
      @task.save!
      flash[:notice] = "Your request has been added"
      redirect_to support_path
    end
  end

  def pdf
    if !params[:pdf].nil?
      @pdf = params[:pdf]
    else
      redirect_to root_path
    end
  end

end