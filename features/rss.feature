Feature: RSS features
    
  @mock
  Scenario: Work with a mock RSS feed
    Given I have a mock RSS document
	  Then I can iterate over the items
	  And I can iterate over the links
	  And I can iterate over the descriptions

  @live
  Scenario: Work with RSS
    When I request a RSS feed "http://www.topix.net/rss/search/article?x=0&y=0&q=London"
    Then I should get a response
	  And I can iterate over the items
	  And I can iterate over the links
	  And I can iterate over the descriptions
