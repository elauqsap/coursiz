class Stat < ActiveRecord::Base
  attr_accessible :users_id

  def self.results_tally(results, params)
  	@c_answers = 0
  	@f_answers = 0
  	@difficulty = 0
  	@stat = Stat.find_by_users_id(params[:current_user]) || Stat.new(:users_id => params[:current_user])
  	if @stat.nil?
  		return
  	end
  	results.each_entry do |entry|
  		if entry[:valid] == 1
  			@c_answers += 1
  		else
  			@f_answers += 1
  		end
  	end
  	@stat.c_answers = (@stat.c_answers || 0 ) + @c_answers
  	@stat.f_answers = (@stat.f_answers || 0 ) + @f_answers
  	puts params[:difficulty]
  	case params[:difficulty].to_i
  	when 1
		@stat.difficulty_1 = (@stat.difficulty_1 || 0) + 1
	when 2
		@stat.difficulty_2 = (@stat.difficulty_2 || 0) + 1
	when 3
		@stat.difficulty_3 = (@stat.difficulty_3 || 0) + 1
	end
  	@stat.quizzes_taken = (@stat.quizzes_taken || 0) + 1
  	@stat.save!
  end

end
