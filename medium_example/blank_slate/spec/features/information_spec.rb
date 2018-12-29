require 'spec_helper'

feature "view information index" do

  # As someone who wants to view information
  # I want to view a page with the information
  # So that I can see what it is

  # * [ ] When I visit /information I should be able to see list of all the information

  scenario "user visits /information path" do
    visit "/information"
    expect(page).to have_content("testing")
  end
end
