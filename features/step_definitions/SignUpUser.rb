Given(/^I am on "(.*?)"$/) do |page|
  
visit "/#{page}"
 
end

When(/^I have added my name "(.*?)"$/) do |names|
  fill_in 'Name', :with => names

end

When(/^have added email "(.*?)"$/) do |email|
  fill_in 'Email', :with => email
   
end

When(/^have added password "(.*?)"$/) do |password|

 fill_in("Password", with: password, :match => :prefer_exact)
end

When(/^have added password conformation "(.*?)"$/) do |password_conformation|
  fill_in 'Password confirmation', :with => password_conformation
    
end

When(/^selected year "(.*?)"$/) do |year|
 select year, :from => 'user_year'
end

When(/^selected major "(.*?)"$/) do |major|
 select major, :from => 'user_discipline'
 
end


When(/^I have pressed "(.*?)"$/) do |button|

 click_button button
end

When(/^I click link "(.*?)"$/) do |link|
  click_link link
end


Then(/^a new account should be created$/) do
 
# pending # express the regexp above with the code you wish you had
end

Then(/^I should be directed to "(.*?)"$/) do |pages|
 #current_path.should == "/#{pages}"
 #save_and_open_page
 #puts page
end

Then(/^I should see "(.*?)"$/) do |warning|

  assert page.has_content?(warning)
end

Given(/^have added current password "(.*?)"$/) do |password_current|
  
 fill_in("Current password", with: password_current, :match => :prefer_exact)

end

When(/^I selected Admin from the database$/) do
   user = User.find_or_create_by_name :name => 'Admin'
   user.role_ids = 'admin'
end




