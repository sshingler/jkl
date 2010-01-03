Feature: Calais-Specific features
  In order to use the Calais Meta-Tagging Service
  As a developer
  I want to make some requests and inspect some responses

  @live
  Scenario: Get nested tags from calais
    Given I have some text
    When I request the nested entities from calais
    Then I should receive the entities grouped into categories
