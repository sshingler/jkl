Feature: Processing features
  In order to integrate our apps
  As a developer
  I want to make some requests and inspect some responses

	@unit @text
	Scenario: Sanitize some ok text
		Given I have a keyphrase 'the cat sat on the mat'
		When I sanitize this text
		Then it should be ok
		And it should say 'the cat sat on the mat'
	
	@unit @text
	Scenario: Sanitize some short text
		Given I have a keyphrase 'the cat sat'
		When I sanitize this text
		Then it should say ''
	
	@unit @text
		Scenario: Sanitize some text with tabs and spaces
		Given I have a keyphrase 'the cat sat on 						the mat            '
		When I sanitize this text
		Then it should say 'the cat sat on the mat'
	
	@unit @text
		Scenario: Sanitize some short text with tabs and spaces
		Given I have a keyphrase 'the   cat sat on 						           '
		When I sanitize this text
		Then it should say ''

	@unit @text
	Scenario: Sanitize some tagged short text
		Given I have a keyphrase '<a href="a-link.html>the cat sat</a>'
		When I sanitize this text
		Then it should say ''

	@unit @text
	Scenario: Sanitize some tagged text
		Given I have a keyphrase '<a href="a-link.html>the cat sat on the mat</a>'
		When I sanitize this text
		Then it should be ok
		Then it should say 'the cat sat on the mat'

	Scenario: Clean a web page
		Given I have a sample BBC story
		When I sanitize this text
		Then it should be ok