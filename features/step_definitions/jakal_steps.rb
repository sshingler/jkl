
Given /^I have a feed "([^\"]*)"$/ do |feed|
  @feed = feed
end

Then /^I can retrieve the links$/ do
  links = Jkl::links @feed
  links.should_not be_nil
end

Then /^I can retrieve the tags$/ do
  key = YAML::load_file('config/keys.yml')['calais']
  links = Jkl::links(@feed)
  tags = Jkl::tags(key,links[rand(links.size)])
  tags.should_not be_nil
end
