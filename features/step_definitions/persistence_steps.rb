Before('@couchdb_needed') do
end

When /^I persist a Trend "([^\"]*)"$/ do |keyphrase|
  @keyphrase = keyphrase
  trend = Trend.new("name" => @keyphrase)
  trend.save
end

Then /^I should be able to view that Trend$/ do
  trends = Trend.by_name :key => @keyphrase
  trend = trends[0]
  trend['name'].should == @keyphrase
  trends.length.should > 0
end

After('@couchdb_needed') do
  delete_db
end