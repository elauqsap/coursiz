class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def enroll


    @categories_enrolled = current_user.categories_enrolled
    @categories_from_form = params[:enrolled_collection]


    if @categories_from_form.nil?
      flash[:notice] = "No category selected"
      redirect_to root_path
    end

    if @categories_enrolled.nil?

      @categories_enrolled = Array.new

    end

      @category_array = @categories_enrolled

      @categories_from_form.each_key do |id|

        if !@category_array.include?(id)
            @category_array << id
        end


      end


    current_user.categories_enrolled = @category_array
    current_user.save

    redirect_to root_path



  end


  def remove_categories

    @categories_enrolled = current_user.categories_enrolled
    @categories_from_form = params[:remove_collection]

    if @categories_from_form.nil?
      flash[:notice] = "No category selected"
      redirect_to root_path
    end

    @category_array = @categories_enrolled


    @categories_from_form.each_key do |id|

      @category_array.delete(id)


    end

    current_user.categories_enrolled = @category_array
    current_user.save

    redirect_to root_path


  end


end