Feature: http features
  In order to use the utility client calls
  As a developer
  I want to make some requests and inspect some responses

  @connection_needed
  Scenario: Make a restful post to yahoo
    When I post some data to yahoo
	  Then I should get a response

  @connection_needed
  Scenario: Make a restful get
    When I make a restful get request
	  Then I should get a response
	  And I should see some text

  @connection_needed
  Scenario: Get some trends
    When I request some trends
	  Then I should get a response
      
  @connection_needed
  Scenario: Get some RSS
    When I request some RSS
	  Then I should get a response
    And I should receive some headlines

  Scenario: Work with RSS
    Given I have some RSS
	  Then I should receive some headlines
	  
	