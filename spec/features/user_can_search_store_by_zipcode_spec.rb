require 'rails_helper'

feature "User can search by zipcode" do
  scenario "User sees a list of stores within 25 miles from a certain zipcode" do
    visit '/'
    
    fill_in 'search', with: "80202"
    click "search"
    
    expect(current_path).to eq('/search')
    expect(page).to have_content "17 Total Stores"
    expect(page).to have_selector(".search-results", count: 15)
    within(".search-results:nth-child(1)") do
      # expect(page).to have_content long name
      # expect(page).to have_content city
      # expect(page).to have_content distance
      # expect(page).to have_content phone number
      # expect(page).to have_content store type
    end
  end
end
