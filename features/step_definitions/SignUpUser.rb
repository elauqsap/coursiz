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


Then(/^I should see "(.*?)"$/) do |warning|

  assert page.has_content?(warning)
  
end

Then(/^a new user "(.*?)" should be created$/) do |userName|
  
	user = User.find_by_name(userName)
end


Given(/^have added current password "(.*?)"$/) do |password_current|
  
 fill_in("Current password", with: password_current, :match => :prefer_exact)

end






