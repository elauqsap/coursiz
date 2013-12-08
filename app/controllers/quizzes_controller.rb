class QuizzesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

  def index
    @quiz = Quiz.all
  end

	def show

    if params[:q].nil?
      session[:answers] = []
      params[:q] = 1
    else
      params[:q] = params[:q].to_i
    end

    # get all quizzes from a certain difficulty
    @quizzes_by_level = Quiz.where(:difficulty => "#{params[:id]}").where(:category_name => "#{params[:category_id]}") || Quiz.new
    puts @quizzes_by_level
    @quizzes_by_level.find_each do |q|
      if q.question_number == params[:q]
        @display_question = q || nil
      end
    end

    if @display_question.nil?
      flash[:warning] = "The quiz requested does not exist"
      # redirect_to root_path # change later
    else
      # may need a better way of randomizing the answers
      questionArray = ["#{@display_question.false_1}","#{@display_question.false_2}","#{@display_question.false_3}","#{@display_question.answer}"]
      questionArray.shuffle!

      @option1 = questionArray[0]
      @option2 = questionArray[1]
      @option3 = questionArray[2]
      @option4 = questionArray[3]
    end
  end

  def new
    redirect_to root_path unless can? :admin, :all
    redirect_to categories_manage_path
  end

  def create
  	redirect_to root_path unless can? :admin, :all
    @params = Quiz.fix_params(params[:quiz])
    @quiz = Quiz.new(@params)
    if !@quiz.valid? || @params.blank?
      @quiz.save
      redirect_to categories_manage_path(:errors => @quiz.errors.messages) and return
    else
      Quiz.create!(@params)
      flash[:notice] = "The question was successfully created!"
      redirect_to request.referer
    end
  end

  def check_answer
    @question_number = (params[:question_number]).to_i
    @count = Quiz.where(:category_name => "#{params[:quiz_category]}").where(:difficulty => "#{params[:quiz_difficulty]}").count || 0
    session[:answers][@question_number] = Quiz.confirm(params)
    if @count == @question_number
      redirect_to quiz_results_path
    else
      @question_number += 1
      redirect_to category_quiz_path(:category_id => params[:quiz_category], :id=> params[:quiz_difficulty], :q => @question_number)
    end
  end

  def results
    @results = session[:answers].compact
    if @results.nil?
      flash[:notice] = "The quiz session is no longer valid!"
      redirect_to root_path
    end 
  end

end