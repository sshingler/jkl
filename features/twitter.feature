Feature: twitter features
  In order to grab some keywords from twitter
  As a developer
  I want to make some requests and inspect some responses
	
  @live
  Scenario: Get some json from twitter
    When I request trends data from twitter
    Then I should get a response
	  And I should see some trends
