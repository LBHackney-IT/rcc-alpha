require 'rails_helper'

RSpec.feature 'Admin can find a property and select resident' do
  scenario 'with correct postcode' do
    stub_property_search
    stub_block_for_property
    stub_estate_for_property
    stub_residents_for_property
    stub_property_find
    visit '/properties/'
    fill_in 'Find a property by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "1 Estate House"
    expect(page).to have_content "Hackney Block"
    expect(page).to have_content "Bob Smith"
    expect(page).to have_content "Hackney Estate"
    expect(page).to have_content "Jane Smith"
    click_on '1 Estate House'
    expect(page).to have_content "Jim Resident"
    click_on 'Janet Resident'
  end

  scenario 'with incorrect postcode' do
    stub_property_search([])
    visit '/properties/'
    fill_in 'Find a property by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "No properties found"
  end

  scenario 'with no residents' do
    stub_property_search
    stub_block_for_property
    stub_estate_for_property
    stub_property_find
    stub_residents_for_property([])
    visit '/properties/'
    fill_in 'Find a property by postcode', with: 'E5 8TE'
    click_on 'Find'
    expect(page).to have_content "1 Estate House"
    expect(page).to have_content "Hackney Block"
    expect(page).to have_content "Bob Smith"
    expect(page).to have_content "Hackney Estate"
    expect(page).to have_content "Jane Smith"
    click_on '1 Estate House'
    expect(page).to have_content "No residents found"
  end
end
