class QuizzesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!
before_filter :set_no_cache

  def index
    @quiz = Quiz.all
  end

  def start
    if Category.find_by_name(params[:category_id]).nil?
      redirect_to root_path
    end  
  end

  def set_session
    if Category.find_by_name(params[:category_id]).nil?
      redirect_to root_path
    else  
      session[:start_quiz] = SecureRandom.hex(32)
      redirect_to category_quiz_path(:category_id => params[:category_id], :id=> params[:id])
    end
  end

	def show
    if Category.find_by_name(params[:category_id]).nil?
      redirect_to root_path and return
    end 
    if !session[:start_quiz].nil?
      if params[:q].nil?
        session[:answers] = []
        session[:questions] = Quiz.quiz_init(params)
        session[:size] = session[:questions].size
        params[:q] = 1
      else
        params[:q] = params[:q].to_i + 1
      end

      @display_question = Quiz.get_question(params, session[:questions], session[:size])
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
    else
      redirect_to start_path(:id => params[:id])
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
    @question_number = session[:size] - session[:questions].size
    @count = Quiz.where(:category_name => "#{params[:quiz_category]}").where(:difficulty => "#{params[:quiz_difficulty]}").count || 0
    session[:answers][@question_number] = Quiz.confirm(params)
    if session[:questions].empty?
      session.delete(:start_quiz)
      session[:stats] = true
      redirect_to quiz_results_path(:difficulty => params[:quiz_difficulty])
    else
      redirect_to category_quiz_path(:category_id => params[:quiz_category], :id=> params[:quiz_difficulty], :q => @question_number)
    end
  end

  def results
    @results = session[:answers].compact
    params[:current_user] = current_user.id
    if @results.nil?
      flash[:alert] = "The quiz session is no longer valid!"
      redirect_to root_path
    else
      if session[:stats]
        session.delete(:stats)
        Stat.results_tally(@results, params)
      end

      @question = Array.new
      @results.each do |result|
        @question << result[:id]
      end
    end 
  end

  def quiz_review
    if !params[:review].nil?
      AdminTask.question_review(params[:review][:question], current_user.id)
      flash[:notice] = "The questions have been submitted for review"
    end
    redirect_to request.referer
  end

  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end