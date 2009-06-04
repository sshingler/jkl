Feature: Calais-Specific features
  In order to use the Calais Meta-Tagging Service
  As a developer
  I want to make some requests and inspect some responses

  Scenario: Get some tags from calais
    When I request tag data from calais
    Then I should get a response
	And I should see some tags