Feature: As a user I want to be able to sign in assuming I have already signed up

Background: User added to coursiz  
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new account should be created 
And I should see "Welcome! You have signed up successfully."
When I click link "Logout"


Scenario: Valid Signin

Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Signed in successfully."

Scenario: incorrect password
Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu"
And have added password "sfnsdkfnashfkj"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Invalid email or password."

Scenario: no Email
Given I am on "users/sign_in"
And have added email ""
And have added password "salkfdjslj"
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Invalid email or password."

Scenario: no password
Given I am on "users/sign_in"
And have added email "gunnar-mills@uiowa.edu" 
And have added password ""
And I have pressed "Sign in"
Then I should be directed to "users/sign_in"
And I should see "Invalid email or password."

Scenario: Forget Password
Given I am on "users/sign_in"
And I click link "Forgot your password?"
And have added email "gunnar-mills@uiowa.edu" 
And I have pressed "Send me reset password instructions"
Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."

Scenario: Forget Password without email
Given I am on "users/sign_in"
And I click link "Forgot your password?"
And I have pressed "Send me reset password instructions"
Then I should see "error prohibited"


Scenario: Forget Password with email that does not exist
Given I am on "users/sign_in"
And I click link "Forgot your password?"
And have added email "kjhfksljh.kjhslksfh@kjlhskljfsh.hjk"
And I have pressed "Send me reset password instructions"
Then I should see "error prohibited"

