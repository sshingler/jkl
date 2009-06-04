require 'lib/rest_client.rb'

Given /^I have some Twitter data$/ do
  @url = YAML::load_file('config.yml')['twitter']
  @response = get_from @url
  result = JSON.parse @response
  trends = result['trends']
  @trend = trends[0]
  
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

