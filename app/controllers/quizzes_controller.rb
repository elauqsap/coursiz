class QuizzesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

  def index
    @quiz = Quiz.all
  end

	def show
    @quiz = Quiz.find_by_name(params[:id]) || ""
    if @quiz.empty?
      flash[:warning] = "The quiz requested does not exist"
      redirect_to root_path # change later
    end
  end

  def new
    redirect_to root_path unless can? :admin, :all
    if params[:errors].blank?
      @quiz = Quiz.new
    else
      @quiz = Quiz.new
      params[:errors].each_pair do |key,val|
        @quiz.errors.add(key,"#{val}")
      end 
    end
  end

  def create
  	redirect_to root_path unless can? :admin, :all
    @params = Quiz.fix_category(params[:quiz])
    @quiz = Quiz.new(@params)
    if !@quiz.valid? || @params.blank?
      @quiz.save
      redirect_to categories_manage_path(:errors => @quiz.errors.messages) and return
    else
      Quiz.create!(@params)
      flash[:notice] = "The quiz was successfully created!"
      redirect_to root_path
    end
  end
end
