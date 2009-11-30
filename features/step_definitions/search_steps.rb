Before do
  User.all.each{ |user| user.destroy }
  (1..2).each do |i|
    user = User.new.from_json(  
        File.open("config/user#{i}_fixture.json","r") {|f| f.readlines.to_s} )
    user.save
  end
end

Given /^I am on (.*)$/ do |url|
 visit url
end

Then /^I should see the search form$/ do
  pending
  response_body.should contain(/Create a new search:/m)
  response_body.should have_selector("input.query")
  response_body.should have_selector('input.create')
end

When /^I fill in and submit the form$/ do
  pending
  fill_in 'query', :with => 'hybrid'
  click_button 'create'
end
