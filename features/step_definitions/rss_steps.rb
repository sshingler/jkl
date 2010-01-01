Given /^I have a mock RSS document$/ do
  raw = File.open('features/mocks/topix_rss.xml','r') {|f| f.readlines.to_s}
  @doc = Hpricot.XML raw
end

Then /^I can iterate over the items$/ do
  @items = Jkl::Rss::items @doc
  @items.length.should == 2
end

Then /^I can iterate over the links$/ do
  links = Jkl::Rss::links(@items)
  links.length.should == 2
  links[0].should == "http://www.localnews8.com/Global/story.asp?S=10876507"
end

Then /^I can iterate over the descriptions$/ do
  descriptions = Jkl::Rss::descriptions(@items)
  descriptions.length.should == 2
  descriptions[0].should == "The King of Pop will get a royal send-off next month in Vienna. Events promoter World Awards Media GmbH confirmed Monday that members of Michael Jackson's family and a \"high-profile lineup of international stars\" are planning a tribute concert in the Austrian capital."
end