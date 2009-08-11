Feature: persistence features
  In order to check out the couchdb persistence layer
  As a developer
  I want to make some requests and inspect some responses

  Scenario: add a document
    When I persist a document
    Then I should get a response
