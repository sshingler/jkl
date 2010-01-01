
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
  key = YAML::load_file('config/keys.yml')['calais']
  @response = Jkl::Extraction::get_from_calais(key, @text)
end

When /^I remove the unwanted items$/ do
  @processed_json = Jkl::clean_unwanted_items_from_hash(JSON.parse(@response))
end

Then /^there should no longer be any "([^\"]*)"$/ do |arg1|
  @processed_json[arg1].should be_nil
end

Then /^I should receive some tags$/ do
  Jkl::get_tag_from_json(@response) do |tag| 
    tag.should_not be_nil
  end
end

Then /^there should be some "([^\"]*)" tags$/ do |arg1|
  Jkl::get_tag_from_json(@response) {|tag|
    #puts tag.inspect
    tag.each{|k,v| puts "#{k} : #{v}" if k=='_type'}
  }
end

Then /^I should be able to see the whole lot of tags as one block$/ do
  tags = Jkl::get_tag_from_json(@response)
  tags.length.should > 0
end

When /^I request the nested entities from calais$/ do
  key = YAML::load_file('config/keys.yml')['calais']
  @response = Jkl::Extraction::tags key, @text
end

Then /^I should receive the entities grouped into categories$/ do
  @response.eql?({"Person"=>["Barack Obama", "Hillary Clinton"], "Position"=>["Secretary of State"]}).should == true
end
