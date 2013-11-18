class Quiz < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3

  validates_presence_of :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3
  belongs_to :category

  def self.fix_category(params)
  	@cat = Category.find_by_real_name(params[:category_id])
  	params[:category_id] = @cat.id
  	puts params[:category_id]
  	return params
  end

end
