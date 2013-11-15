class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :quizzes

  def self.test(id)
  	@cg = Category.find_by_id(id)
  	puts "{#@cg}"
  end

end
