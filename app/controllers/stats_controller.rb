class StatsController < ApplicationController
before_filter :authenticate_user!

  def index
  	if Stat.find_by_users_id(current_user.id).nil?
  		flash[:warning] = "You currently have no Quiz Statistics"
  		redirect_to root_path
  	else
    	@chart = Stat.create_chart(current_user.id)
    	@answer_count = Stat.get_correct(current_user.id)
    	@wrong_count = Stat.get_incorrect(current_user.id)
    end
  end

end
