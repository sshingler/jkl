Feature: persistence features
  In order to check out the couchdb persistence layer
  As a developer
  I want to make some requests and inspect some responses

  @couchdb_needed
  Scenario: add a Trend
    When I persist a Trend "london restaurants"
    Then I should be able to view that Trend

