Feature: RSS features
    
  @mock
  Scenario: Work with RSS
    Given I have a mock RSS document
	  Then I can iterate over the items
	  And I can iterate over the links
	  And I can iterate over the descriptions
