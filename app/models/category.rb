class Category < ActiveRecord::Base
  attr_accessible :name, :real_name
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :quizzes

  def self.list
  	@arr = Array.new
  	@all = Category.all
  	(0..@all.size - 1).each do |index|
  		@arr.push(@all[index].real_name)
  	end
  	return @arr
  end

  def self.validator(params)
  	return params[:name].gsub(/(\b\s*)/,'').strip.downcase
  end

end
