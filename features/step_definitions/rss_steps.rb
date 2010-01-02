Given /^I have a mock RSS document$/ do
  raw = File.open('features/mocks/topix_rss.xml','r') {|f| f.readlines.to_s}
  @response = Hpricot.XML raw
end

When /^I request a RSS feed "([^\"]*)"$/ do |url|
  @response = Jkl::get_xml_from url
end

Then /^I can iterate over the items$/ do
  @items = Jkl::Rss::items @response
  @items.should_not be_nil
  @items.length.should > 0
end

Then /^I can iterate over the links$/ do
  links = Jkl::Rss::links(@items)
  links.length.should > 0
end

Then /^I can iterate over the descriptions$/ do
  descriptions = Jkl::Rss::descriptions(@items)
  descriptions.length.should > 0
end
