
When "I surf to '$url'" do |url|
  visit url
end

Then /^I should see '(.*)'$/ do |text|
  response_body.should contain(/#{text}/m)
end

Then /^I should see a list of 10 trends$/ do
  text = "here are the top twitter trends right now"
  response_body.should contain(/#{text}/m)
  response_body.should have_selector("ol.tweets")
  response_body.should have_selector('li.tweet', :count => 10)
end

Given /^I add my own trend$/ do
  fill_in 'keyphrase', :with => 'london restaurants'
  click_button 'search'
end
