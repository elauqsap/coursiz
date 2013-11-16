class Category < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :quizzes

  def self.validator(params)
  	return params[:name].gsub(/(\b\s*)/,'').strip.downcase
  end

end
