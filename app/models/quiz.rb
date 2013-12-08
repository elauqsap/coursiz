class Quiz < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3, :category_name, :question_number

  validates_presence_of :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3
  belongs_to :category

  @SIZE = 10

  def self.fix_params(params)
  	@cat = Category.find_by_real_name(params[:category_id])
    if @cat.nil?
      return Hash.new
    end
    
  	if params[:difficulty].eql? 'Beginning'
  		params[:difficulty] = 1
  	elsif params[:difficulty].eql? 'Middle'
  		params[:difficulty] = 2
  	elsif params[:difficulty].eql? 'End'
  		params[:difficulty] = 3
  	end

    @count = Quiz.where("difficulty = ? AND category_name = ?", params[:difficulty], @cat.name).count || 0
    @count += 1
    
    params[:question_number] = @count
  	params[:category_id] = @cat.id
    params[:category_name] = @cat.name
  	return params
  end

  def self.progresses
    %w(Beginning Middle End)
  end

  def self.confirm(params)
    @check = 0
    if params[:answer].eql? Quiz.find_by_id(params[:question_id]).answer
      @check = 1
    end
    return {:id => params[:question_id], :user => params[:answer], :valid => @check }
  end

  def self.quiz_init(params)
    @questions = Array.new
    @quizzes = Quiz.where("difficulty = ? AND category_name = ?", params[:id], params[:category_id]) || nil
    if @quizzes.nil?
      return nil
    else
      (1..@quizzes.size).each do |x|
        @questions.push(x)
      end
      @questions.shuffle!
      @questions.shuffle!
      while @questions.size > @SIZE do
        @questions.pop
      end
      return @questions
    end
  end

  def self.get_question(params, questions, size)
    if params[:q] == ((size+1) - questions.size)
      @question_number = questions.pop
    end
    return Quiz.where("difficulty = ? AND category_name = ? AND question_number = ?", params[:id], params[:category_id], @question_number)[0]
  end

end