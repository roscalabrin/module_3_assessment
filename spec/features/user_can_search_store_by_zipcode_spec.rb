require 'rails_helper'

feature "User can search by zipcode" do
  scenario "User sees a list of stores within 25 miles from a certain zipcode" do
    VCR.use_cassette("search_by_zip_code") do
      visit '/'
      
      fill_in "zip_code", with: "80202"
      click_on "search"
      
      expect(current_path).to eq('/search')
      expect(page).to have_content "17 Total Stores"
      expect(page).to have_selector(".search-results", count: 15)
      within(".search-results:first") do
        expect(page).to have_content "Best Buy Mobile - Cherry Creek Shopping Center"
        expect(page).to have_content "Denver"
        expect(page).to have_content 3.25
        expect(page).to have_content "303-270-9189"
        expect(page).to have_content store type "Mobile"
      end
    end
  end
end
