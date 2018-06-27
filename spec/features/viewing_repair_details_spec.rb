require 'rails_helper'

RSpec.feature 'Admin can view repair details' do
  scenario 'for a completed repair' do
    stub_property_find
    stub_repair_find
    visit '/properties/000001/repairs/23487'
    expect(page).to have_content "Broken Light"
    expect(page).to have_content "23487"
    expect(page).to have_content "Test Name"
    expect(page).to have_content "077777777"
    expect(page).to have_content "work order 1 of 1"
    expect(page).to have_content "20040020"
    expect(page).to have_content "387475"
    expect(page).to have_content "£10.50"
    expect(page).to have_content "Immediate"
    expect(page).to have_content "Completed"
    expect(page).to have_content "Geoff Smith"
    expect(page).to have_content "Job Physically Complete"
    expect(page).to have_content "SW"
    expect(page).to have_content "12 mm bitumen impregnated brds: laid ,loose"
  end

  scenario 'for an in progress repair' do
    stub_property_find
    stub_inprogress_repair_find
    visit '/properties/000001/repairs/23487'
    expect(page).to have_content "Stuck Door Handle"
    expect(page).to have_content "23487"
    expect(page).to have_content "Test Name"
    expect(page).to have_content "077778777"
    expect(page).to have_content "work order 1 of 1"
    expect(page).to have_content "20040020"
    expect(page).to have_content "387475"
    expect(page).to have_content "£10.50"
    expect(page).to have_content "In Progress"
    expect(page).to have_content "SW"
    expect(page).to have_content "12 mm bitumen impregnated brds: laid ,loose"
  end
end
