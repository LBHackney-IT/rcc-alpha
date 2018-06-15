require 'rails_helper'

RSpec.feature 'Admin can find a property' do
  scenario 'with correct postcode' do
    stub_property_search
    visit '/properties/'
    fill_in 'Find address by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "1 Estate House"
  end

  scenario 'with incorrect postcode' do
    stub_property_search([])
    visit '/properties/'
    fill_in 'Find address by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "No properties found"
  end
end
