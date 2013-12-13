Feature: As a user I want to be able to edit my account
Background: movies have been added to RottenPotatoes  
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then a new user "Jack O'Neill" should be created 
And I should see "Welcome! You have signed up successfully."


Scenario: Valid password change

Given I am on "users/edit"
And have added password "smiling12"
And have added password conformation "smiling12"
And have added current password "bigjohn1234" 
And I have pressed "Update"
Then I should see "You updated your account successfully."
When I click link "Logout"
Given I am on "users/sign_in"
And have added email "jack-oneill@stargatecommand.com" 
And have added password "smiling12"
And I have pressed "Sign In"
And I should see "Signed in successfully."

Scenario: Valid email change

Given I am on "users/edit"
And have added password ""
And have added password conformation ""
And have added email "james-couch@uiowa.edu" 
And have added current password "bigjohn1234" 
And I have pressed "Update"
Then I should see "You updated your account successfully."
When I click link "Logout"
Given I am on "users/sign_in"
And have added email "james-couch@uiowa.edu" 
And have added password "bigjohn1234"
And I have pressed "Sign In"
Then I should see "Signed in successfully."

Scenario: Invalid current password
Given I am on "users/edit"
And have added password "smiling12"
And have added password conformation "smiling12"
And have added current password "kjhkbklhg" 
And I have pressed "Update"
Then I should see "we need your current password to confirm your changes"

Scenario: password and paassword conformation don't

Given I am on "users/edit"
And have added password "smiling12"
And have added password conformation "smiling01"
And have added current password "bigjohn1234" 
And I have pressed "Update"
Then I should see "doesn't match confirmation"


Scenario: current password blank

Given I am on "users/edit"
And have added password "smiling12"
And have added password conformation "smiling12"
And have added current password "" 
And I have pressed "Update"
Then I should see "we need your current password to confirm your changes"

Scenario: leave password/current password blank

Given I am on "users/edit"
And have added password ""
And have added password conformation ""
And have added current password "bigjohn1234" 
And I have pressed "Update"
Then I should see "You updated your account successfully."
When I click link "Logout"
Given I am on "users/sign_in"
And have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And I have pressed "Sign In"
Then I should see "Signed in successfully."




