Feature: Library features
  In order to use the utility client calls
  As a developer
  I want to make some requests and inspect some responses

  Scenario: Get some json from twitter
    When I request trends data from twitter
    Then I should get a response
	And I should see some trends

  Scenario: Get some tags from calais
    When I request tag data from calais
    Then I should get a response
	And I should see some tags
	
  Scenario: Make a restful post to yahoo
    When i post some data to yahoo
	Then I should get a response

  Scenario: Make a restful get
    When i make a restful get request
	Then I should get a response
	And I should see some text

  Scenario: Get some RSS
    When i request some RSS
	Then I should get a response
    And I should see some items
