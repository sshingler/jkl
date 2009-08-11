
Given /^I have some simple text$/ do
  @text = "Barack Obama said today that he expects there to be conflict within his new security team after confirming Hillary Clinton as his choice for US Secretary of State."
end

Given /^I have a sanitized sample BBC story$/ do
  Given "I have a sample BBC story"
	When "I sanitize this text"
end

Given /^I have a mock calais response$/ do
  @json = File.open('features/mocks/calais.json','r') {|f| f.readlines.to_s}
end

When /^I post to calais$/ do
  @response = get_from_calais @text
end

When /^I remove the unwanted items$/ do
  @processed_json = clean_unwanted_items_from_hash(JSON.parse(@json))
end

Then /^there should no longer be any "([^\"]*)"$/ do |arg1|
  @processed_json[arg1].should be_nil
end

Then /^I should see some tags$/ do
  get_tag_from_json(@response) {|tag| tag.should_not be_nil}
end