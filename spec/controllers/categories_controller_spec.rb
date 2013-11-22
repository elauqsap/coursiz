require 'spec_helper'

describe CategoriesController do
  before (:each) do
    @admin = FactoryGirl.create(:admin)
    visit "/categories_manage"
  end
  
 # describe NewCategory do
  #  it 
 # end 

end
