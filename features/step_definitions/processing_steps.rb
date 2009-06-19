require 'lib/rest_client.rb'

Given /^I have some Twitter data$/ do
  @url = YAML::load_file('config.yml')['twitter']
  @response = get_from @url
  result = JSON.parse @response
  trends = result['trends']
  @trend = trends[0]
  
end

Given /^I have a calais json response$/ do
  @raw_json = {"name"=>"test", "instances"=>[], "relevance"=>0.062, "_type"=>"SportsEvent", "resolutions"=>[], "_typeGroup"=>"entities", "blank"=>"", "not_available"=> "N/A"}
end

When /^I get some news stories from the first keyword$/ do
  search_term = @trend['name'].gsub('#','') #removing hash from start of trend name
  puts  search_term
  search_term = 'london'
  url = "#{YAML::load_file('config.yml')['topix']}#{search_term}"
  rss_response = get_from_as_xml url
  items = get_items_from rss_response
  links = []
  items.each do |item|
    links << attribute_from(item, :link)
  end
  puts links[0]
  @story = sanitize_text from_doc get_from links[0]
end

When /^I request tags for the first story$/ do
  r = get_from_calais @story
  h = get_tags_from_rdf get_from_calais @story
  h.each{|k,v| puts "#{k} : #{v}"}
end

When /^I remove the unwanted items$/ do
  @processed_json = clean_unwanted_items_from_hash @raw_json
end

Then /^there should no longer be any "([^\"]*)"$/ do |arg1|
  @processed_json[arg1].should be_nil
end
