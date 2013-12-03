class QuizzesController < ApplicationController
protect_from_forgery
before_filter :authenticate_user!

  def index
    @quiz = Quiz.all
  end

	def show

    if params[:q].nil?
      # if no parameter is given, default to the first question
      params[:q] = 1

    else

      params[:q] = params[:q].to_i

    end

    @chosenQuizNumber = ""

    puts params[:id]

    # get all quizzes from a certain difficulty
    @quizObject = Quiz.where(:difficulty => "#{params[:id]}")
    @q2 = @quizObject.where(:category_name => "#{params[:category_id]}")

      @q2.find_each do |q|

      if q.question_number == params[:q]

        @chosenQuizNumber = q
        
      end

    end


    if @chosenQuizNumber.class == String
      flash[:warning] = "The quiz requested does not exist"
      redirect_to root_path # change later

    else

      # may need a better way of randomizing the answers
      questionArray = ["#{@chosenQuizNumber.false_1}","#{@chosenQuizNumber.false_2}","#{@chosenQuizNumber.false_3}","#{@chosenQuizNumber.answer}"]
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
    @params = Quiz.fix_category(params[:quiz])
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

convert = (params[:quiz_number]).to_i
next_question = convert + 1

flash[:notice] = "That was either right or wrong!!"
redirect_to category_quiz_path(:category_id => params[:quiz_category], :id=> params[:quiz_difficulty], :q => next_question)




end



end
