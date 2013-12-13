Feature: As an admin I want to view tasks for the day

Background: Valid Signin with Admin
Given I am on "users/sign_in"
And have added email "admin@coursiz.herokuapp.com" 
And have added password "Admin.coursiz!"
And I have pressed "Sign In"
And I should see "Signed in successfully."