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
      expect(page).to have_content()

      # And the stations should be limited to Electric and Propane
      expect().to

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      epect(page).to have_content("Address:")
      epect(page).to have_content("Fuel Types:")
      epect(page).to have_content("Distance:")
      epect(page).to have_content("Access Times:")
    end
  end
end
