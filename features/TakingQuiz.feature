Feature: As an user I want to take a quiz

Background: Admin User added to coursiz  
Given I am on "users/sign_up"
When I have added my name "Commander" 
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And have added password conformation "Admin.coursiz!"
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new user "Commander" should be created 
And I should see "Welcome! You have signed up successfully."
When I click link "Logout"
When I selected id "1" Admin from the database
Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign in"
And I should see "Signed in successfully."
And I should see "Manage"
When I click link "Manage"
And have added name "Selt"
And I have pressed "Add Category"
And I should see "Selt"
And selected category "Selt"
And selected progress "Middle"
And I have entered Question "2 * 2?"
And I have entered Answer "four"
And I have entered FalseAnswer1 "nine"
And I have entered FalseAnswer2 "ten"
And I have entered FalseAnswer3 "twenty"
And I have pressed "Submit Question"
Then I should see "The question was successfully created!"
And selected category "Selt"
And selected progress "Middle"
And I have entered Question "2 + 2"
And I have entered Answer "four"
And I have entered FalseAnswer1 "nine"
And I have entered FalseAnswer2 "eight"
And I have entered FalseAnswer3 "ten"
And I have pressed "Submit Question"
Then I should see "The question was successfully created!"
When I click link "Logout"
Given I am on "users/sign_up"
When I have added my name "Jack O'Neill" 
And have added email "jack-oneill@stargatecommand.com" 
And have added password "bigjohn1234"
And have added password conformation "bigjohn1234" 
And selected year "Senior"
And selected major "Computer"
And I have pressed "Sign up"
Then a new user "Jack O'Neill" should be created 
And I should see "Welcome! You have signed up successfully."

Scenario: Take quiz
Given I click link "All Quizzes"
Then I should see "Selt"
When I click link "Selt"
When I click link "2"
And I click link "Start Quiz"
And I choose "answer_four"
And I have pressed "Submit"
And I choose "answer_four"
And I have pressed "Submit"

