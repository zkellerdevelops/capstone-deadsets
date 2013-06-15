Feature: User can log in
  In order to log in to site
  As a user
  I want to enter my username
  I want to enter my password


  Scenario: Happy Path
    Given the user "zach"
    When I go to the homepage
    And I click "submit"
    Then I should be sent to next page