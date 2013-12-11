class Stat < ActiveRecord::Base
  attr_accessible :users_id


  def self.get_count_by_difficulty(current_user, difficulty)
    @stat = Stat.find_by_users_id(current_user)

    if difficulty == "beginning"
      return @stat.difficulty_1

    elsif difficulty == "middle"
      return @stat.difficulty_2
    elsif difficulty == "end"
      return @stat.difficulty_3

    end
        

  end

  def self.get_correct(current_user)

    @correct = Stat.find_by_users_id(current_user)

    return @correct.c_answers

  end
  def self.get_incorrect(current_user)

    @wrong = Stat.find_by_users_id(current_user)

    return @wrong.f_answers

  end

  def self.get_correct_or_incorrect_by_difficulty(current_user,state,difficulty)

    @stat = Stat.find_by_users_id(current_user)

    if state == "correct"
      if difficulty == "beginning"
        return @stat.correct_answers_beginning

      elsif difficulty == "middle"
        return @stat.correct_answers_middle

      elsif difficulty == "end"
        return @stat.correct_answers_end
      end
          
    elsif state == "incorrect"
      if difficulty == "beginning"
        return @stat.false_answers_beginning
      elsif difficulty == "middle"
        return @stat.false_answers_middle
      elsif difficulty == "end"
        return @stat.false_answers_end
      end


    end
        



  end




  def self.results_tally(results, params)
  	@c_answers = 0
  	@f_answers = 0
  	@difficulty = 0

  	@stat = Stat.find_by_users_id(params[:current_user]) || Stat.new(:users_id => params[:current_user])
  	if @stat.nil?
  		return
  	end

    @correct_answers_beginning = @stat.correct_answers_beginning || 0
    @correct_answers_middle = @stat.correct_answers_middle || 0
    @correct_answers_end = @stat.correct_answers_end || 0

    @false_answers_beginning = @stat.false_answers_beginning || 0
    @false_answers_middle = @stat.false_answers_middle || 0
    @false_answers_end = @stat.false_answers_end || 0



  	results.each_entry do |entry|
  		if entry[:valid] == 1
  			@c_answers += 1
        
		    if params[:difficulty].to_i == 1
   			  @correct_answers_beginning += 1
     		elsif params[:difficulty].to_i == 2
 			    @correct_answers_middle += 1
		    elsif params[:difficulty].to_i == 3
			     @correct_answers_end+= 1
		  end

  	else
  		@f_answers += 1
		 if params[:difficulty].to_i == 1
			   @false_answers_beginning += 1
		    elsif params[:difficulty].to_i == 2
			     @false_answers_middle += 1
		    elsif params[:difficulty].to_i == 3
			     @false_answers_end+= 1
			end 

  		end


  	end


    @stat.correct_answers_beginning = @correct_answers_beginning
    @stat.correct_answers_middle = @correct_answers_middle
    @stat.correct_answers_end = @correct_answers_end


    @stat.false_answers_beginning = @false_answers_beginning
    @stat.false_answers_middle = @false_answers_middle
    @stat.false_answers_end = @false_answers_end


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

  def self.create_chart(current_user, chart)
    @stat = Stat.find_by_users_id(current_user)

    @correct_answers_beginning = @stat.correct_answers_beginning || 0
    @correct_answers_middle = @stat.correct_answers_middle || 0
    @correct_answers_end = @stat.correct_answers_end || 0

    @false_answers_beginning = @stat.false_answers_beginning || 0
    @false_answers_middle = @stat.false_answers_middle || 0
    @false_answers_end = @stat.false_answers_end || 0

    @difficulty_1_count = Stat.get_count_by_difficulty(current_user,"beginning")
    @difficulty_2_count = Stat.get_count_by_difficulty(current_user,"middle")
    @difficulty_3_count = Stat.get_count_by_difficulty(current_user,"end")



    if chart =="percent_pie"

          @chart  = LazyHighCharts::HighChart.new('pie') do |f|
              f.chart({:defaultSeriesType=>"pie" , :width => "400", :height => "300" })
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


      elsif chart == "difficulty_bar"
          @chart = LazyHighCharts::HighChart.new('column') do |f|
              f.chart( :width => "400", :height => "300" )
              f.series(:name=>'Correct',:data=> [@correct_answers_beginning.to_i, @correct_answers_middle, @correct_answers_end ])
              f.series(:name=>'Incorrect',:data=>[@false_answers_beginning.to_i, @false_answers_middle, @false_answers_end] )  
              f.xAxis(:categories => ['Beginning','Middle','End'])
              f.yAxis(:min => 0)

              ###  Options for Bar
              ### f.options[:chart][:defaultSeriesType] = "bar"
              ### f.plot_options({:series=>{:stacking=>"normal"}}) 

              ## or options for column
              f.options[:chart][:defaultSeriesType] = "column"
              f.plot_options({:column=>{:stacking=>"normal"}})             
            end

        
      elsif chart == "results_bar"
            @chart = LazyHighCharts::HighChart.new('bar') do |f|
                f.chart( :width => "400", :height => "300" )
                f.series(:name=>'Attempts',:data=> [@difficulty_1_count, @difficulty_2_count, @difficulty_3_count ])
                f.xAxis(:categories => ['Beginning','Middle','End'])
                f.yAxis(:min => 0)

                ###  Options for Bar
                ### f.options[:chart][:defaultSeriesType] = "bar"
                ### f.plot_options({:series=>{:stacking=>"normal"}}) 

                ## or options for column
                f.options[:chart][:defaultSeriesType] = "column"
                f.plot_options({:column=>{:stacking=>"normal"}}) 
              end

      else

        @chart = nil

      end

    return @chart
  end


end
