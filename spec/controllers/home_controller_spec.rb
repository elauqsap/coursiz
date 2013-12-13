require 'spec_helper'

  # get '/studyguides', to: 'home#studyguides', as: 'studyguides'
  # get '/pdf', to: 'home#pdf', as: 'pdf'
  # get '/admin_task/', to: 'home#index', as: 'index'
  # post '/complete', to: 'home#complete', as: 'complete'
  # get '/support', to: 'home#support', as: 'support'
  # post '/add_task', to: 'home#add_task', as: 'add_task'

describe HomeController do

  before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
  end
  
  describe "Test Admin Routing" do
    before (:each) do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should have proper routes" do
      {:get => "/admin_task" }.should be_routable
      {:get => "/categories/manage" }.should be_routable
      {:get => "/pdf" }.should be_routable
      {:get => "/support" }.should be_routable        
      {:get => "/studyguides" }.should be_routable 
      {:post => "/add_task" }.should be_routable
      {:post => "/complete" }.should be_routable         
    end
  end

  describe "Test User Routing'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should have proper routes" do
      {:get => "/pdf" }.should be_routable
      {:get => "/support" }.should be_routable        
      {:get => "/studyguides" }.should be_routable 
      {:post => "/add_task" }.should be_routable
      {:post => "/complete" }.should be_routable
    end
  end

  # describe 'adding new task' do
  #   after :each do
  #     flash[:notice].should_not be_nil
  #   end
  #   it 'should redirect on invalid adds' do
  #     post :add_task, { :admin_task => {} }
  #     should validate_presence_of(:request).with_message(/can't be blank/)
  #   end
  #   it 'should receive a create and redirect on valid adds' do
  #     #Movie.should_receive(:create_from_tmdb).with({"request_type"=>"Add Feature", "request"=>"Please fix this test"})
  #     post :add_task, { :admin_task => {"request_type"=>"Add Feature", "request"=>"Please fix this test"} }
  #   end
  # end
end
