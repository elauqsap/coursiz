class Quiz < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3, :category_name, :question_number

  validates_presence_of :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3
  belongs_to :category

  def self.fix_category(params)
  	@cat = Category.find_by_real_name(params[:category_id])
    if @cat.nil?
      return Hash.new
    end
	if params[:difficulty].eql? 'Beginning'
		params[:difficulty]=1
	elsif params[:difficulty].eql? 'Middle'
		params[:difficulty]=2
	else 
		params[:difficulty]=3
	end 

    # find the most recient quiz based on the category, and increment the number count
    # @RecientQuiz1 = (Quiz.find_by_category_id(@cat.id) 
    #   @r1 = @RecientQuiz1.
    #   @r2 = @RecientQuiz1.find(:last,:question_number)
    @r1 = Quiz.where(:category_name => params[:category_id]) || ""
    @r2 = @r1.where(:difficulty => params[:difficulty]) || ""
    @r3 = @r2.find(:last,:question_number) || ""

    if @r3.blank?

      @quizNumber =1

    else

    @quizNumber = @r3.question_number + 1

  end

    params[:question_number] = @quizNumber
  	params[:category_id] = @cat.id
    params[:category_name] = @cat.name
  	return params
  end

def self.progresses
    %w(Beginning Middle End)
  end

end
