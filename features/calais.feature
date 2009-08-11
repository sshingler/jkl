Feature: Calais-Specific features
  In order to use the Calais Meta-Tagging Service
  As a developer
  I want to make some requests and inspect some responses

  @connection_needed
  Scenario: Post some very simple text to calais, inspect the response
	Given I have some simple text
    When I post to calais
    Then I should get a response
	And I should see some tags

  @connection_needed
  Scenario: Post a mock story to calais, inspect the response
	Given I have a sanitized sample BBC story
	When I post to calais
	Then I should get a response
	And I should see some tags
	
  Scenario: Clean up blank items from a calais response
	Given I have a mock calais response
	When I remove the unwanted items
	Then there should no longer be any "instances"
	And there should no longer be any "relevance"
	And there should no longer be any "blank"
 	And there should no longer be any "not_available"