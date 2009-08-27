
Given /^I have some simple text$/ do
  @text = "Barack Obama said today that he expects there to be conflict within his new security team after confirming Hillary Clinton as his choice for US Secretary of State."
end

Given /^I have a sanitized sample BBC story$/ do
  Given "I have a sample BBC story"
	When "I sanitize this text"
end

Given /^I have a mock calais response$/ do
  @response = File.open('features/mocks/calais.json','r') {|f| f.readlines.to_s}
end

When /^I post to calais$/ do
  @response = get_from_calais @text
end

When /^I remove the unwanted items$/ do
  @processed_json = clean_unwanted_items_from_hash(JSON.parse(@response))
end

Then /^there should no longer be any "([^\"]*)"$/ do |arg1|
  @processed_json[arg1].should be_nil
end

Then /^I should receive some tags$/ do
  get_tag_from_json(@response) do |tag| 
    tag.should_not be_nil
  end
end

Then /^there should be some "([^\"]*)" tags$/ do |arg1|
  get_tag_from_json(@response) {|tag|
    #puts tag.inspect
    tag.each{|k,v| puts "#{k} : #{v}" if k=='_type'}
  }
end

Then /^I should be able to see the whole lot of tags as one block$/ do
  tags = get_tag_from_json(@response)
  tags.length.should > 0
end

