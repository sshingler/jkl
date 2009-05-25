Feature: Library features
  In order to use the utility client calls
  As a developer
  I want to make some requests and inspect some responses

  Scenario: get some json from twitter
    When I request trends data from twitter
    Then I should get a response
	And I should see some json tags

  Scenario: get some tags from calais
    When I request tag data from calais
    Then I should get a response
	And I should see some tags
	
  Scenario: make a restful post to yahoo
    When i post some data to yahoo
	Then I should get a response
    And I should see some tags

  Scenario: make a restful get
    When i make a restful get request
	Then I should get a response
    And I should see some tags
	And I should see some text

  Scenario: get some RSS
    When i request some RSS
	Then I should get a response
    And I should see some tags

  Scenario: inspect some RSS
    When i request some RSS
	Then I should get a response
    And I should see some tags

  Scenario: get some RSS links
	When i request some RSS
	When I look for some links
	Then I should see some link data
