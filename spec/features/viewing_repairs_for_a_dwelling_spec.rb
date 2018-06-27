require 'rails_helper'

RSpec.feature 'Admin can view repairs for a dwelling' do
  scenario 'with repairs' do
    stub_property_find
    stub_repairs_for_property
    visit '/properties/000001/repairs'
    expect(page).to have_content "Broken Light"
  end

  scenario 'with no repairs' do
    pending
    stub_property_find
    stub_repairs_for_property([])
    visit '/properties/000001/repairs'
    expect(page).to have_content "No repairs"
  end
end
