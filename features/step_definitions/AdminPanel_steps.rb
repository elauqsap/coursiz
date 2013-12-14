When (/^selected request "(.*?)"$/) do |request|
	select request, :from => 'admin_task_request_type'
end

When (/^I fill in "([^\"]*)" with "([^\"]*)"$/) do |field, value|
  fill_in('admin_task_request', :with => value)
end

Then (/^I should get a response with status "(\d+)"$/) do |status|
  page.driver.status_code.should == status.to_i
end