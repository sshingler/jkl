
Given /^I have some text$/ do
  @text = "Barack Obama said today that he expects there to be conflict within his new security team after confirming Hillary Clinton as his choice for US Secretary of State."
end

When /^I request the nested entities from calais$/ do
  key = YAML::load_file('config/keys.yml')['calais']
  @response = Jkl::Extraction::tags key, @text
end

Then /^I should receive the entities grouped into categories$/ do
  @response.eql?({"Person"=>["Barack Obama", "Hillary Clinton"], "Position"=>["Secretary of State"]}).should == true
end
