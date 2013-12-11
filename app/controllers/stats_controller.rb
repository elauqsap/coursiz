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
	
@bar = LazyHighCharts::HighChart.new('column') do |f|
    f.series(:name=>'John',:data=> [3, 20, 3 ])
    f.series(:name=>'Jane',:data=>[1, 3, 4] )  
    f.title({ :text=>"example test title from controller"})

    ###  Options for Bar
    ### f.options[:chart][:defaultSeriesType] = "bar"
    ### f.plot_options({:series=>{:stacking=>"normal"}}) 

    ## or options for column
    f.options[:chart][:defaultSeriesType] = "column"
    f.plot_options({:column=>{:stacking=>"percent"}})
   
        end



    end
  end

end
