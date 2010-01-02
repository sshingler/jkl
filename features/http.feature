Feature: http features
  In order to use the utility client calls
  As a developer
  I want to make some requests and inspect some responses

  @live
  Scenario: Make a restful post to yahoo
    When I post some data to yahoo
	  Then I should get a response

  @live
  Scenario: Make a restful get
    When I make a restful get request
	  Then I should get a response
	  And I should see some text

  @live
  Scenario: Get some trends
    When I request some twitter trends
	  Then I should get a response
