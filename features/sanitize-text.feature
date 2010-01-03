Feature: Processing features
  In order to integrate our apps
  As a developer
  I want to make some requests and inspect some responses

  @unit @text
  Scenario: No changes needed
    Given I have the text "the cat sat on the mat"
    When I sanitize this text
    Then there should be no script tags
    And there should be no tags
    And there should be no blank lines
    And it should say "the cat sat on the mat"

  @unit @text
  Scenario: Remove simple tags
    Given I have the text "<a href=\"a-link.html\">the cat sat on the mat</a>"
    When I sanitize this text
    Then there should be no script tags
    And there should be no tags
    And there should be no blank lines
    Then it should say "the cat sat on the mat"

  @unit @text @wip
  Scenario: Remove script tags
    Given I have some script tag data
    When I sanitize this text
    Then there should be no script tags
    And there should be no tags
    And there should be no blank lines
    Then it should say "  some start stuff here     some para stuff here   some end stuff here"

  @mock
  Scenario: Remove script tags
    Given a sample web page
    When I remove the script tags
    Then there should be no script tags

  @mock
  Scenario: Remove all tags
    Given a sample web page
    When I remove the script tags
    And I strip all the tags
    Then there should be no script tags
    And there should be no tags

  @mock
  Scenario: Remove empty lines
    Given a stripped web page
    When I remove the blank lines
    Then there should be no blank lines

  @mock
  Scenario: Santize a sample BBC page
    Given I have a sample BBC story
    When I sanitize this text
    Then there should be no script tags
    And there should be no tags
    And there should be no blank lines