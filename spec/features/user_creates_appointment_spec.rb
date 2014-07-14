require 'rails_helper'

feature 'user creates appointment', %Q{
 I want to create an appointment to show agents
} do

  scenario 'seller signs and created appointment' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user)
    visit properties_path
    click_on "New Appointment"

    expect(page).to have_content 'Create An Appointment'
    expect(page).to have_content property.name
  end


  scenario 'seller signs and created appointment' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user)
    visit properties_path
    click_on "New Appointment"
    select 'January', from: 'appointment_meeting_2i'
    select '31', from: 'appointment_meeting_3i'
    select '2015', from: 'appointment_meeting_1i'
    select '12 PM', from: 'appointment_meeting_4i'
    select '00', from: 'appointment_meeting_5i'
    fill_in 'instructions', with: 'Show them the yard'
    fill_in 'visitor', with: 'Marsha Brady'
    fill_in 'appointment_visitor_phone', with: '555-111-9999'
    fill_in 'appointment_visitor_email', with: 'marsha@bradybunch.com'
    click_on 'Create Appointment'

    expect(page).to have_content 'Appointment created successfully.'
    expect(page).to have_content "Appointments"
    expect(page).to have_content 'Marsha Brady'
    expect(page).to have_content 'January 31, 2015'
    expect(page).to have_content property.name
    expect(page).to have_content property.zip_code
  end

end
