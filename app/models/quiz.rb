class Quiz < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3

  validates_presence_of :category_id, :difficulty, :question, :answer, :false_1, :false_2, :false_3
  belongs_to :category

  def self.fix_category(params)
  	@cat = Category.find_by_real_name(params[:category_id])
    if @cat.nil?
      return Hash.new
    end
	if params[:difficulty].eql'Beginning'
		params[:difficulty]=1
	elsif params[:difficulty].eql'Middle'
		params[:difficulty]=2
	else 
		params[:difficulty]=3
	end 

	
  	params[:category_id] = @cat.id
  	return params
  end

def self.progresses
    %w(Beginning Middle End)
  end

end
