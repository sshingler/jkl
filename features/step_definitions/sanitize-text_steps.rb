Given "I have the text \"$text\"" do |text|
  @text = text
end

Given /^I have a sample BBC story$/ do
  @text = File.open('features/mocks/bbc_story.html','r') {|f| f.readlines.to_s}
end

Given /^I have some script tag data$/ do
  @text = <<-EOF;
  the cat sat on the mat
  <script type="text/javascript" charset="utf-8">
   function nofunction(){var bob;}
  </script>
  <p> some para stuff here </p>
  some end stuff here
    EOF
end

Given /^I have a sample web page$/ do
  @text = File.open('features/mocks/sample-web-page.html','r') {|f| f.readlines.to_s}
end

Given /^a stripped web page$/ do
  Given "I have a sample web page"
  When "I remove the script tags"
  And "I strip all the tags"
  Then "there should be no script tags"
  And "there should be no tags"
end

When /^I sanitize this text$/ do
  @text = Jkl::Text::sanitize @text
end

When /^I examine the text$/ do
  text = Jkl::Text::remove_tabs @text
end

Then "it should say \"$text\"" do |text|
  @text.to_s.should == text
end

Then /^I can read it$/ do
  Jkl::Text::document_from(@response).should_not be_nil
end

When /^I remove the script tags$/ do
  @text = Jkl::Text::remove_script_tags @text
end

When /^I remove the blank lines$/ do
  @text = Jkl::Text::remove_blank_lines @text
end

When /^I remove the short lines$/ do
  @text = Jkl::Text::remove_short_lines @text
end

When /^I clean it up$/ do
  @text = Jkl::Text::remove_short_lines Jkl::Text:: strip_all_tags Jkl::Text::remove_script_tags @text
end

When /^I strip all the tags$/ do
  @text = Jkl::Text::strip_all_tags @text
end

Then /^there should be no tags$/ do
  @text.match(/</).should be_nil
end

Then /^there should be no script tags$/ do
  @text.match(/<script/).should be_nil
end

Then /^there should be no blank lines$/ do
  @text.match(/\r/).should be_nil
  @text.match(/\n/).should be_nil
end
