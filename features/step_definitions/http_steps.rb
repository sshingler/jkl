When /^I post some data to yahoo$/ do
  @url = URI.parse('http://search.yahooapis.com/ContentAnalysisService/V1/termExtraction')
  appid = LICENSE_ID = YAML::load_file('config/keys.yml')['yahoo']
  context = URI.encode('Italian sculptors and painters of the renaissance favored the Virgin Mary for inspiration')
  post_args = { 'appid' => appid, 'context' => context, 'output' => 'json' }
  @response = post_to @url, post_args
end

When /^I request some RSS$/ do
  keyphrase = @keyphrase || "iraq"
  url = "#{YAML::load_file('config/config.yml')['topix']}#{CGI::escape(keyphrase)}"
  @response = get_from_as_xml url
end

Given /^I have some RSS$/ do
  raw = File.open('features/mocks/topix_rss.xml','r') {|f| f.readlines.to_s}
  @response = Hpricot.XML raw
end

When /^I make a restful get request$/ do
  url = "http://news.bbc.co.uk/1/hi/uk_politics/7677419.stm" 
  @response = get_from url
end

Then /^I should get a response$/ do
  @response.should_not == nil
  #puts @response
end

Then /^I should receive some headlines$/ do
  @items = get_items_from @response
  @links = []
  @items.each do |item|
    @links << attribute_from(item, :link)
  end
  @links.should_not == nil
  @links.length.should > 0
end

Then /^I should be able to get the copy from the first headline$/ do
  @response = get_from @links[0]
  @response.should_not be_nil
  @response.should_not == ""
  @text = sanitize @response
end

Then /^I should see some text$/ do
  @response.length.should > 0
end
