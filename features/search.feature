Feature: Homepage
	In order to use the app
	As a user
	I want to hit the homepage and search for some urls

	@acceptance
	Scenario: Perform a search
		Given I am on /
		When I fill in "Query" with "test query"
		And I click the "Create" button
		Then I should see the search results
		
	@acceptance
	Scenario: Send
		Given I have performed a search
		When I click the "Send to sophia" button
		Then I should be redirected to the homepage
		And I should be able to see the search name