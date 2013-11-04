Feature: As a user I want to be able to sign in assuming I have already signed up

Background: movies have been added to RottenPotatoes  
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new account should be created 
And I should be directed to "users/sign_up"

Scenario: Valid Signin
Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu" 
And have added on signin password "bigjohn1234"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"

Scenario: incorrect password
Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu" 
And have added on signin password "sfnsdkfnashfkj"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Invalid email or password."

Scenario: no Email
Given I am on "users/sign_in"
And have added email "" 
And have added on signin password "salkfdjslj"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Invalid email or password."

Scenario: no password
Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu" 
And have added on signin password ""
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Invalid email or password."
