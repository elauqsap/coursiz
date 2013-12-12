class AdminTask < ActiveRecord::Base
  attr_accessible :user_id, :request_type, :request
  validates_presence_of :request_type, :request

  def self.request_types
  	 %W(#{"Request Help"} #{"Question Review"} #{"Quiz Review"} #{"Add Feature"} #{"Site Issue"})
  end

  def self.question_review(params, user_id)
  	create!(:user_id => user_id, :request_type => "Question Review", :request => params.join(","))
  end

  def self.complete(tasks)
  	tasks[:done].each_entry do |entry|
  		@delete_task = find_by_id(entry)
  		@delete_task.delete
  		@delete_task.save!
  	end
  end

  def self.fix_task
  	@tasks = AdminTask.all
  	@tasks.each_entry do |task|
  		if task[:request_type].match(/Question Review/)
        task[:request] = "Please review the following questions for accuracy " + task[:request].gsub!(",", ", ")
      end
  	end
  	return @tasks
  end

end
