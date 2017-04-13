require 'rails_helper'

RSpec.feature "user searches and finds Best Buy stores" do
  scenario "user finds best buy stores" do
  # As a user
  # When I visit "/"
  visit root_path
  # And I fill in a search box with "80202" and click "search"
  fill_in("Search", with: "80202")

  # Then my current path should be "/search" (ignoring params)
  expect(current_path).to eq('/search')
  # And I should see stores within 25 miles of 80202
  expect(page).to have_content("all the stores")
  # And I should see a message that says "16 Total Stores"
  expect(page).to have_content("16 Total Stores")
  # And I should see exactly 10 results
  expect(page).to have_content("ten store names")
  expect(page).to_not have_content("11th store name")

  #consider 
  # And I should see the long name, city, distance, phone number and store type for each of the 10 results
  within("#store_1") do
    expect(page).to have_content("1st store name")
    expect(page).to have_content("1st store city")
    expect(page).to have_content("1st store distance")
    expect(page).to have_content("1st store phone")
    expect(page).to have_content("1st store type")
  end
end