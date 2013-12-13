Feature: As a user I want to be able to Sign In assuming I have already signed up

Background: User added to coursiz  
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
When I click link "Logout"


Scenario: Valid Signin
Given I am on "users/sign_in"
When have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And I have pressed "Sign In"
Then I should see "Signed in successfully."

Scenario: incorrect password
Given I am on "users/sign_in"
When have added email "jack-oneill@stargatecommand.com"
And have added password "sfnsdkfnashfkj"
And I have pressed "Sign In"
And I should see "Invalid email or password."

Scenario: no Email
Given I am on "users/sign_in"
When have added email ""
And have added password "salkfdjslj"
And I have pressed "Sign In"
Then I should see "Invalid email or password."

Scenario: no password
Given I am on "users/sign_in"
When have added email "jack-oneill@stargatecommand.com" 
And have added password ""
And I have pressed "Sign In"
Then I should see "Invalid email or password."

Scenario: Forget Password
Given I am on "users/sign_in"
And I click link "Forgot your password?"
And have added email "jack-oneill@stargatecommand.com" 
And I have pressed "Reset My Password"
Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."

Scenario: Forget Password without email
Given I am on "users/sign_in"
And I click link "Forgot your password?"
And I have pressed "Reset My Password"
Then I should see "error prohibited"


Scenario: Forget Password with email that does not exist
Given I am on "users/sign_in"
And I click link "Forgot your password?"
And have added email "kjhfksljh.kjhslksfh@kjlhskljfsh.hjk"
And I have pressed "Reset My Password"
Then I should see "error prohibited"

