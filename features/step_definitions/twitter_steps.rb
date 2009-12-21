Given /^I have a mock twitter response$/ do
  @response = File.open('features/mocks/twitter.json','r') {|f| f.readlines.to_s}
end

When /^I request trends data from twitter$/ do
  @url = YAML::load_file('config/config.yml')['twitter']
  @response = Jkl::get_from @url
end

Then /^I should see some trends$/ do
  result = JSON.parse @response
  trends = result['trends']
  trends.each do |subject|
    subject['name'].length.should > 1
    subject['url'].length.should > 1
  end
end