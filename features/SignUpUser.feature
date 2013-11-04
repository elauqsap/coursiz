Feature: As a user I want to be able to sign up a new account

Scenario: Add valid unique user
Given I am on "users/sign_up"
Then I should be directed to "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 


And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new account should be created 
And I should be directed to "users/sign_up"

Scenario: Using incorrect password conformation
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "sdlfkjsd" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then I should be directed to "users/sign_up"
And I should see "Please review the problems below:"

Scenario: Leaving name field blank
Given I am on "users/sign_up"
When I have added my name "" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then I should be directed to "users/sign_up"
And I should see "Please review the problems below:"

Scenario: Leaving email field blank
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then I should be directed to "users/sign_up"
And I should see "Please review the problems below:"


Scenario: Leaving email field blank
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then I should be directed to "users/sign_up"
And I should see "Please review the problems below:"

Scenario: Leaving password blank
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password ""
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then I should be directed to "users/sign_up"
And I should see "Please review the problems below:"

Scenario: Leaving password conformation blank
Given I am on "users/sign_up"
When I have added my name "Big John" 
And have added email "gunnar-mills@uiowa.edu" 
And have added password "bigjohn1234"
And have added password conformation "" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then I should be directed to "users/sign_up"
And I should see "Please review the problems below:"