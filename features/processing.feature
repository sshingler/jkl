Feature: Processing features
  In order to integrate our apps
  As a developer
  I want to make some requests and inspect some responses

  Scenario: Feed from Twitter to Topix
    Given I have some Twitter data
    When I get some news stories from the first keyword
    Then I should get a response
	When I request tags for the first story
	Then I should get a response