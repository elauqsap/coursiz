Feature: As an admin I would like to view tasks for the day

Background: Admin User added to coursiz  
Given I am on "users/sign_up"
When I have added my name "Commander" 
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And have added password conformation "Admin.coursiz!"
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then a new user "Commander" should be created 
And I should see "Welcome! You have signed up successfully."
When I click link "Logout"
When I selected id "1" Admin from the database
Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign In"
And I should see "Signed in successfully."

Scenario: A user takes a Quiz and thinks the answers are wrong
Given I am on "support"
And selected request "Add Feature"
And I fill in "Please comment on the Request or Issue" with "As a user I would like to know who built this lousy app"
And I have pressed "Submit"
Then I should get a response with status "200"
And I should see "Your request has been added"