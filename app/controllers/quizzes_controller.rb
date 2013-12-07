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

converted_number = (params[:quiz_number]).to_i

@check1 = Quiz.where(:category_name => params[:quiz_category]) || ""
@check2 = @check1.where(:difficulty => params[:quiz_difficulty]) || ""
@check3 = @check2.find(:last,:question_number) || ""

if @check3.question_number == converted_number

  flash[:notice] = "Quiz is over!"
  redirect_to quiz_results_path

else

  cookie_record = {:q_number => params[:quiz_number], :q_answer => params[:answer]}

  if cookies[:answer_cookie].blank?
      cookies[:answer_cookie] = { 
      :value => cookie_record.to_json, 
      :expires => 4.years.from_now
    }

  else

    
  end




  next_question = converted_number + 1
  flash[:notice] = "That was either right or wrong!!"
  redirect_to category_quiz_path(:category_id => params[:quiz_category], :id=> params[:quiz_difficulty], :q => next_question)

end


end



def results




end


end
