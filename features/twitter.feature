Feature: twitter features
  In order to grab some keywords from twitter
  As a developer
  I want to make some requests and inspect some responses

  Scenario: Work with twitter trends
    Given I have a mock twitter response
	Then I should see some trends
	
  @connection_needed
  Scenario: Get some json from twitter
    When I request trends data from twitter
    Then I should get a response
	And I should see some trends
	
  
