Feature: As an admin I want to be able to add categories


Background: 
Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Signed in successfully."


