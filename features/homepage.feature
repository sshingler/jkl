Feature: Homepage
  In order to use the app
  As a user
  I want to hit the homepage and see some initial trends

  @connection_needed
  Scenario: hit the homepage and view the top 10 trends
    When I surf to '/'
	Then I should see a list of 10 trends

  @connection_needed
  Scenario: add my own trend
	When I surf to '/'
	Given I add my own trend
	
  Scenario: use a mock calais response to layout the page
	When I surf to '/mock'
	Then I should see some stuff
	
