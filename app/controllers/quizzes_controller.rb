class QuizzesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

  def index
    @cat = Quiz.all
  end

	def show
    @cat = Quiz.find_by_name(params[:id])
  end

  def new
    @cat = Quiz.new
    redirect_to root_path unless can? :admin, :all
  end

  def create
  	redirect_to root_path unless can? :admin, :all
    @name = Quiz.validator(params[:Quiz])
    if !Quiz.find_by_name(@name).blank?
      flash[:warning] = "#{@name} already exists!"
      redirect_to new_Quiz_path
    else
      Quiz.create!("name" => "#{@name}")
      flash[:notice] = "#{@name} was added successfully!"
      redirect_to root_path
    end
  end
end
