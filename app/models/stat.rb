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

  def self.create_chart(current_user)
    @stat = Stat.find_by_users_id(current_user)
    @chart  = LazyHighCharts::HighChart.new('pie') do |f|
        f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
        series = {
                 :type=> 'pie',
                 :name=> 'Browser share',
                 :data=> [
                    ['Correct', ((@stat.c_answers.to_f/(@stat.c_answers.to_f+@stat.f_answers.to_f)) * 100).round(2)],
                    ['Wrong', ((@stat.f_answers.to_f/(@stat.c_answers.to_f+@stat.f_answers.to_f)) * 100).round(2)]
                 ]
        }
        f.series(series)
        f.options[:title][:text] = "Answer Ratio"
        f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
        f.plot_options(:pie=>{
          :allowPointSelect=>true, 
          :cursor=>"pointer" , 
          :dataLabels=>{
            :enabled=>true,
            :color=>"black",
            :style=>{
              :font=>"13px Trebuchet MS, Verdana, sans-serif"
            }
          }
        })
    end 
    return @chart
  end
end
