@javascript
Feature: A User visiting the login page
In order the check out Cribber
I want to get to its login page
So that I can signup or signin

  Scenario: A new user visits Cribber
  Given I am a new user
  When I visit the home page
  Then I should see "Cribber"
