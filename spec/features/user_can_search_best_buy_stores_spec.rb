require 'rails_helper'

RSpec.feature "user searches and finds Best Buy stores", :vcr do
  scenario "user finds best buy stores" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in a search box with "80202" and click "search"
    fill_in("Search", with: "80202")
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq('/search')
    # And I should see stores within 25 miles of 80202
    save_and_open_page

    # And I should see a message that says "16 Total Stores"
    expect(page).to have_content("16 Total Stores within 25 Miles")
    # And I should see exactly 10 results
    expect(page).to have_content("CHERRY CREEK MALL")
    expect(page).to have_content("BELMAR CO")
    expect(page).to have_content("COLORADO BLVD CO")
    expect(page).to have_content("WESTMINSTER CO")
    expect(page).to have_content("NORTHGLENN")
    expect(page).to have_content("TOWN CENTER AURORA")
    expect(page).to have_content("AURORA CO")
    expect(page).to have_content("LITTLETON CO")
    expect(page).to have_content("SOUTHGLENN CO")

    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
      expect(page).to have_content("CHERRY CREEK MALL")
      expect(page).to have_content("DENVER")
      expect(page).to have_content("3.45")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile SAS")
    end
end