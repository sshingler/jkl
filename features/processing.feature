Feature: Processing features
  In order to integrate our apps
  As a developer
  I want to make some requests and inspect some responses
	
  Scenario: Sanitize some text
	Given I have a keyphrase 'the cat sat on the mat'
	When I sanitize this text
	Then it should be ok

  Scenario: Clean a web page
	Given I have a sample BBC story
	When I sanitize this text
	Then it should be ok
	
  @connection_needed	 
  Scenario: end to end flow, keyphrase to tags
	Given I have a keyphrase 'london restaurants'
	When I request some RSS
	Then I should receive some headlines
	And I should be able to get the copy from the first headline
	When I post to calais
	Then I should receive some tags
	And I should be able to persist these tags
	When I generate a view of the recent keyword results
	Then I should see a network graph