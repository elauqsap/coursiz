Feature: As an admin I want to be able to manage 

Background: Admin User added to coursiz  
Given I am on "users/sign_up"
When I have added my name "Commander" 
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And have added password conformation "Admin.coursiz!"
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new account should be created 
And I should see "Welcome! You have signed up successfully."
When I click link "Logout"
When I selected id "1" Admin from the database

Scenario: Valid Signin with Admin

Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign in"
And I should see "Signed in successfully."
And I should see "Manage"

Scenario: Make another user Admin

Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
And I should see "Welcome! You have signed up successfully."
When I click link "Logout"
Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign in"
And I should see "Signed in successfully."
When I click link "Admin"
When I selected id "2" Admin from the database
When I click link "Logout"
Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And I have pressed "Sign in"
And I should see "Signed in successfully."
And I should see "Manage"

Scenario: Add New Category 

Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign in"
And I should see "Signed in successfully."
And I should see "Manage"
When I click link "Manage"
And have added name "Selt"
And I have pressed "Add Category"
And have added name "Digital Design"
And I have pressed "Add Category"
And I should see "Selt"
And I should see "Digital Design"

