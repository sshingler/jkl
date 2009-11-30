
Then /^I should go to "([^\"]*)"$/ do |path|
  current_url.should == path
end


When /^I login$/ do
  fill_in "login", :with => "test user1"
  fill_in "password", :with => "password"
  click_button "submit"
  
end

Given /^I am logged in$/ do
  Given "I am on /login"
	When "I login"
end

Then /^we can check the user "([^\"]*)" has project data$/ do |name|
  user = User.from_name(name)
  
  User.get_project(user.id, "u1_proj2").name.should == "u1_proj2"
  User.get_project(user.id, "u2_proj2").should be_nil
  User.get_project(user.id, "u1_proj2sdf").should be_nil
  User.get_project(user.id, "").should be_nil
  User.get_project(user.id, nil).should be_nil
  
  project = User.get_project(user.id, "u1_proj2")

  User.get_list(user.id, project.id, "u1_p2_list2").name.should == "u1_p2_list2"
  User.get_list(user.id, project.id, "u1_p1_list2").should be_nil
  User.get_list(user.id, project.id, "u2_p1_list2").should be_nil
  
  list = User.get_list(user.id, project.id, "u1_p2_list1")
  
  search = User.get_search(user.id, project.id, list.id, "u1_p2_l1_search1")
  User.get_search(user.id, project.id, list.id, "u1_p2_l1_search1").query.should == "u1_p2_l1_search1"
  
  
  User.get_link(user.id, project.id, list.id, search.id, "u1_p2_l1_s1_link2").url.should == "u1_p2_l1_s1_link2"
end
  
