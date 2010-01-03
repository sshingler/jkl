Feature: Jakal main features

  @live
  Scenario: Get links
    Given I have a feed "http://www.topix.net/rss/search/article?x=0&y=0&q=London"
    Then I can retrieve the links

  @live
  Scenario: Get tags
    Given I have a feed "http://www.topix.net/rss/search/article?x=0&y=0&q=London"
    Then I can retrieve the tags