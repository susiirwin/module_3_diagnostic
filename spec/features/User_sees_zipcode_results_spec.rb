require 'rails_helper'

RSpec.feature "User Search Results" do
  scenario "User searches for a zipcode" do
     VCR.use_cassette("zipcode_search") do
      visit "/"

      # And I fill in the search form with 80203
      fill_in 'q', with: "80203"
      # And I click "Locate"
      click_on 'Locate'

      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to eq("/search")

      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_content(station_name: "Metrogas Inc")
      expect(page).to have_content(station_name: "AmeriGas")

      # And the stations should be limited to Electric and Propane
      expect(fuel.type).should include("ELEC")
      expect(fuel.type).should include("LPG")

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      expect(page).to have_content("Name:")
      expect(page).to have_content("Street Address:")
      expect(page).to have_content("Zip:")
      expect(page).to have_content("State:")
      expect(page).to have_content("Fuel Types:")
      expect(page).to have_content("Distance:")
      expect(page).to have_content("Access Times:")
    end
  end
end
