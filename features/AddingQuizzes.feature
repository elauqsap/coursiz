Feature: As an admin I want to be able to manage 

Background: Admin User added to coursiz  
Given I am on "users/sign_up"
When I have added my name "Admin" 
And have added email "admin@coursiz.herokuapp.com" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new account should be created 
And I should see "Welcome! You have signed up successfully."
When I selected Admin from the database





