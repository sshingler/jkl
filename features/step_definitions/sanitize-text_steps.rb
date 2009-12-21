Given "I have a keyphrase '$text'" do |text|
  @text = text
end

Given /^I have a sample BBC story$/ do
  @text = File.open('features/mocks/bbc_story.html','r') {|f| f.readlines.to_s}
end

When /^I sanitize this text$/ do
  @text = Jkl::sanitize @text
end

Then /^it should be ok$/ do
  @text.should_not be_nil
  @text.should_not == ""
end

Then "it should say '$text'" do |text|
  @text.should == text
end

Given /^I have some script tag data$/ do
  @text = <<-EOF;
  some start stuff here
  <script type="text/javascript" charset="utf-8">
   function nofunction(){var bob;}
  </script>
  <p> some para stuff here </p>
  some end stuff here
    EOF
end

