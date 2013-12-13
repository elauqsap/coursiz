



When(/^I selected id "(.*?)" Admin from the database$/) do |arg1|
  user = User.find_or_create_by_id :id => arg1
   user.add_role('admin')
   user.save
end

When(/^have added name "(.*?)"$/) do |category|
   fill_in 'Name', :with => category
end

When(/^selected category "(.*?)"$/) do |category|
  
 select category, :from => 'Category'
end

When(/^selected progress "(.*?)"$/) do |progress|
	select progress, :from => 'Progress'
  
end

When(/^I have entered Question "(.*?)"$/) do |question|
   fill_in 'Question', :with => question
end

When(/^I have entered Answer "(.*?)"$/) do |answer|
 fill_in("Answer", with: answer, :match => :prefer_exact)
end

When(/^I have entered FalseAnswer1 "(.*?)"$/) do |falseOne|
  fill_in 'quiz_false_1', :with => falseOne
end

When(/^I have entered FalseAnswer2 "(.*?)"$/) do |falseTwo|
   fill_in 'quiz_false_2', :with => falseTwo
end

When(/^I have entered FalseAnswer3 "(.*?)"$/) do |falseThree|
   fill_in 'quiz_false_3', :with => falseThree
end

When(/^show me page$/) do
  save_and_open_page
end

When(/^I choose "(.*?)"$/) do |radioButton|
  choose(radioButton)
end



