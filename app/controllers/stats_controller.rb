class StatsController < ApplicationController
before_filter :authenticate_user!

  def index
  	if Stat.find_by_users_id(current_user.id).nil?
  		flash[:warning] = "You currently have no Quiz Statistics"
  		redirect_to root_path
  	else
    	@percent_chart = Stat.create_chart(current_user.id,"percent_pie")

    	@answer_count = Stat.get_correct(current_user.id)
    	@wrong_count = Stat.get_incorrect(current_user.id)
    	@percent_correct = ((@answer_count.to_f/(@answer_count.to_f+@wrong_count.to_f)) * 100).round(2)
    	@percent_wrong = ((@wrong_count.to_f/(@answer_count.to_f+@wrong_count.to_f)) * 100).round(2)

    	@difficulty_chart = Stat.create_chart(current_user.id,"difficulty_bar")

    	@correct_1 = Stat.get_correct_or_incorrect_by_difficulty(current_user.id,"correct","beginning")
    	@correct_2 = Stat.get_correct_or_incorrect_by_difficulty(current_user.id,"correct","middle")
    	@correct_3 = Stat.get_correct_or_incorrect_by_difficulty(current_user.id,"correct","end")

    	@false_1 = Stat.get_correct_or_incorrect_by_difficulty(current_user.id,"incorrect","beginning")
    	@false_2 = Stat.get_correct_or_incorrect_by_difficulty(current_user.id,"incorrect","middle")
    	@false_3 = Stat.get_correct_or_incorrect_by_difficulty(current_user.id,"incorrect","end")

    	@results_chart = Stat.create_chart(current_user.id,"results_bar")

    	@difficulty_1_count = Stat.get_count_by_difficulty(current_user.id,"beginning")
    	@difficulty_2_count = Stat.get_count_by_difficulty(current_user.id,"middle")
    	@difficulty_3_count = Stat.get_count_by_difficulty(current_user.id,"end")


    end
  end

end
