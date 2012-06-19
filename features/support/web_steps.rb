When /^(?:|I )visit the (.+)$/ do |page|
  path_to(page)
end

Then /^I should see "(.+)"$/i do |arg1|
  page.should have_content arg1
end

When /^I wait for (\d+) seconds?$/ do |count|
  sleep count.to_i
end
