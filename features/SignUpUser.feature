Feature: As a user I want to be able to Sign Up a new account

Scenario: Add valid unique user
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

Scenario: Using incorrect password conformation
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And have added password conformation "sdlfkjsd" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then I should see "Please review the problems below:"

Scenario: Using incorrect email
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "alksdjflsadkjf" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then I should see "Please review the problems below:"


Scenario: Leaving name field blank
Given I am on "users/sign_up"
When I have added my name "" 
And have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then I should see "Please review the problems below:"

Scenario: Leaving email field blank
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then I should see "Please review the problems below:"

Scenario: Leaving password blank
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "jack-oneill@stargatecommand.com" 
And have added password ""
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then I should see "Please review the problems below:"

Scenario: Leaving password conformation blank
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And have added password conformation "" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign Up"
Then I should see "Please review the problems below:"
