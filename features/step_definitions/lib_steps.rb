require 'hpricot'
require 'json'
require 'webrat'

require 'lib/rest_client.rb'
require 'lib/rss_client.rb'
require 'lib/calais_client.rb'
require 'lib/url_doc_handler.rb'

include Jkl

When /^I request tag data from calais$/ do
  @response = call "Barack Obama said today that he expects there to be conflict within his new security team after confirming Hillary Clinton as his choice for US Secretary of State."
end

When /^i post some data to yahoo$/ do
  @url = URI.parse('http://search.yahooapis.com/ContentAnalysisService/V1/termExtraction')
  appid = LICENSE_ID = YAML::load_file('keys.yml')['yahoo']
  context = URI.encode('Italian sculptors and painters of the renaissance favored the Virgin Mary for inspiration')
  post_args = { 'appid' => appid, 'context' => context, 'output' => 'json' }
  @response = post_to @url, post_args
end

When /^i request some RSS$/ do
  url = "http://www.topix.net/rss/search/article?x=0&y=0&q=iraq"
  @response = from_rss url
end

When /^i make a restful get request$/ do
  url = "http://news.bbc.co.uk/1/hi/uk_politics/7677419.stm" 
  @response = from url
end

When /^I request trends data from twitter$/ do
  @url = 'http://search.twitter.com/trends.json'
  @response = from @url
end

Then /^I should get a response$/ do
  @response.should_not == nil
end

Then /^I should see some items$/ do
  @items = get_items @response
  @links = []
  @items.each do |item|
    @links << attribute_from(item, :link)
  end
  @links.should_not == nil
  @links.length.should > 0
end

Then /^I should see some text$/ do
  @response.length.should > 10
end

Then /^I should see some tags$/ do
  tags = get_tags @response
  tags.class.to_s.should == "Hash"
  tags.length.should > 0
end

Then /^I should see some trends$/ do
  result = JSON.parse @response
  trends = result['trends']
  trends.each do |subject|
    subject['name'].length.should > 1
    subject['url'].length.should > 1
  end
end
