class AdminTask < ActiveRecord::Base
  attr_accessible :user_id, :type, :request

  def self.request_types
  	 %W(#{"Request Help"} #{"Question Review"} #{"Quiz Review"} #{"Add Feature"} #{"Site Issue"})
  end

  def self.question_review(params, user_id)
  	create!(:user_id => user_id, :type => "Question Review", :request => params.join(","))
  end

end
