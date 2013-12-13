require 'spec_helper'

describe HomeController do

  describe "GET 'Admin index'" do
    before (:each) do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'User index'" do
    before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
