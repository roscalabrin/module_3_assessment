require 'rails_helper'

feature "User can access homepage" do
  scenario "user vists the homepage" do
    
    visit '/'
    
    expect(page.status_code).to eq 200
    within('h1') do
      expect(page).to have_content('Items')
    end
  end
end