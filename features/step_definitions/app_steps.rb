require 'hpricot'
require 'json'
require 'webrat'

require 'lib/rest_client.rb'
require 'lib/rss_client.rb'
require 'lib/calais_client.rb'
require 'lib/url_doc_handler.rb'

include RSSClient
include RestClient
include CalaisClient
include URLDocHandler

Given "a data '$source'" do |source|
  @url = source
end

Given "i surf to '$url'" do |url|
  visits url
end

When /^I request tag data from calais$/ do
  @response = CalaisClient::call("Barack Obama said today that he expects there to be conflict within his new security team after confirming Hillary Clinton as his choice for US Secretary of State.")
end

When /^i post some data to yahoo$/ do
  @url = URI.parse('http://search.yahooapis.com/ContentAnalysisService/V1/termExtraction')
  appid = 'oj4bhg7V34H7HYoy2dwypOs_kyHpwLMhe5RtNJMHFjpnEqDA2Xb7bYwtnju52V1LB_EV'
  context = URI.encode('Italian sculptors and painters of the renaissance favored the Virgin Mary for inspiration')
  output = 'json'
  @post_args = { 'appid' => appid, 'context' => context, 'output' => output }
  @response = post_to(@url, @post_args)
end

When /^i request some RSS$/ do
  url = "http://www.topix.net/rss/search/article?x=0&y=0&q=iraq"
  @response = from_rss url
end

Given /^i request a web page$/ do
  url = "http://news.bbc.co.uk/1/hi/uk_politics/7677419.stm" 
  @response = get_text from_url url
end

When /^i make a restful get request$/ do
  url = "http://news.bbc.co.uk/1/hi/uk_politics/7677419.stm" 
  @response = get_from url
end

When /^I request trends data from twitter$/ do
  @url = 'http://search.twitter.com/trends.json'
  @response = get_from @url
end

Then /^I should get a response$/ do
  @response.should_not == nil
end

When /^I look for some items$/ do
  When "I inspect the response"
  @items = get_items @response
end

When /^I look for some links$/ do
  When "I look for some items"
  @links = []
  @items.each do |item|
    @links << attribute_from(item, :link)
  end
end

Then /^I should see some text$/ do
  @response.length.should > 10
end

Then /^I should see some tags$/ do
  tags = CalaisClient::get_tags(@response)
  tags.class.to_s.should == "Hash"
  tags.length.should > 0
end

Then /^I should see some data$/ do
  @items.should_not == nil
end

Then /^I should see some link data$/ do
  @links.should_not == nil
end

Then /^I should see some json tags$/ do
  result = JSON.parse(@response)
  trends = result['trends']
  trends.each do |subject|
    subject['name'].length.should > 1
    subject['url'].length.should > 1
  end
end

Then /^I should see a list of 10 trends$/ do

end


