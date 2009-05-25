Feature: Homepage
  In order to start viewing the gladrags
  As a user
  I want to hit the homepage and see some initial trends

  Scenario: hit the homepage and view the top 10 trends
    Given i surf to '/'
	Then I should see a list of 10 trends

  Scenario: add my own trend
	Given i add my own trend