Feature: Processing features
  In order to integrate our apps
  As a developer
  I want to make some requests and inspect some responses
	
  Scenario: Sanitize some text
	Given I have 'the cat sat on the mat'
	When I sanitize this text
	Then it should be ok

  Scenario: Clean a web page
	Given I have a sample BBC story
	When I sanitize this text
	Then it should be ok