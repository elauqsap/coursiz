Feature: As an admin I want to be able to manage 

Background: Admin User added to coursiz  
Given I am on "users/sign_up"
When I have added my name "Admin" 
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And have added password conformation "Admin.coursiz!"
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new account should be created 
And I should see "Welcome! You have signed up successfully."
When I click link "Logout"
When I selected Admin from the database

Scenario: Valid Signin

Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign in"

And I should see "Signed in successfully."
When I click link "Account"
Then I should be directed to "users/sign_in"


