Feature: Authorisation
	In order to login and logout

	@acceptance
	Scenario: Login
		Given I am on /
		Then I should go to "/login"
		When I login
		Then I should go to "/"
		
	@acceptance
	Scenario: Logout
		Given I am logged in
		When I click on logout
		Then I should go to "/login"
		
	@unit
	Scenario: drill down
	  Then we can check the user "test user1" has project data
