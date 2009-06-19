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
    When I post some data to yahoo
	Then I should get a response

  Scenario: Make a restful get
    When I make a restful get request
	Then I should get a response
	And I should see some text

  Scenario: Get some RSS
    When I request some RSS
	Then I should get a response
    And I should see some items

  Scenario: Sanitize some text
	Given I have 'the cat sat on the mat'
	When I sanitize this text
	Then it should be ok

  Scenario: Using a Mock JSON response, parse Calais output
	#http://www.thegolfchannel.com/tour-insider/peter-hanson-qualifies-open-hole-in-one-29471/
	Given I have a Mock Calais response
	When I parse this response
	Then I should get a response
	
  Scenario: Persist some mock tags
	Given I have a Mock Calais response
	When I parse this response
	Then the tags should be persisted
	
	
