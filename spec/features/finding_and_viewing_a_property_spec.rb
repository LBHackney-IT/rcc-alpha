require 'rails_helper'

RSpec.feature 'Admin can find a property' do
  scenario 'with correct postcode' do
    stub_property_search
    stub_block_for_property
    stub_estate_for_property
    visit '/properties/'
    fill_in 'Find address by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "1 Estate House"
    expect(page).to have_content "Hackney Block"
    expect(page).to have_content "Bob Smith"
    expect(page).to have_content "Hackney Estate"
    expect(page).to have_content "Jane Smith"
  end

  scenario 'with incorrect postcode' do
    stub_property_search([])
    visit '/properties/'
    fill_in 'Find address by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "No properties found"
  end
end
