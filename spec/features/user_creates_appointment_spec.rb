require 'rails_helper'
require 'pry'

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
    expect(page).to have_content "January 31 2015"
    expect(page).to have_content property.name
    expect(page).to have_content property.zip_code
  end


  scenario 'user can’t create an appointment with a date in the past' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user)
    visit properties_path
    click_on "New Appointment"
    select 'January', from: 'appointment_meeting_2i'
    select '31', from: 'appointment_meeting_3i'
    select '2013', from: 'appointment_meeting_1i'
    select '12 PM', from: 'appointment_meeting_4i'
    select '00', from: 'appointment_meeting_5i'
    fill_in 'instructions', with: 'Show them the yard'
    fill_in 'visitor', with: 'Marsha Brady'
    fill_in 'appointment_visitor_phone', with: '555-111-9999'
    fill_in 'appointment_visitor_email', with: 'marsha@bradybunch.com'
    click_on 'Create Appointment'

    expect(page).to have_content 'Appointment could not be saved.'
    expect(page).not_to have_content "Marsha"

    visit properties_path
    expect(page).not_to have_content "Marsha"
    expect(page).not_to have_content '555-111-9999'
  end

    scenario "agent can't create a property" do
    user1 = FactoryGirl.create(:user, role: 'agent')
    agent = FactoryGirl.create(:agent_profile, user: user1)
    user = agent.user
    sign_in_as(user1)

    expect(page).not_to have_content 'New Property'
    expect(page).to have_content 'Available appointments in your area:'
  end

  scenario 'user creates multiple appointments' do
    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user)
    appointment1 = FactoryGirl.create(:appointment, property: property)
    appointment2 = FactoryGirl.create(:appointment, property: property)
    appointment3 = FactoryGirl.create(:appointment, property: property)

    visit properties_path
    expect(page).to have_content appointment1.visitor
    expect(page).to have_content appointment1.visitor_phone
    expect(page).to have_content appointment2.visitor
    expect(page).to have_content appointment2.visitor_phone
    expect(page).to have_content appointment3.visitor
    expect(page).to have_content appointment3.visitor_phone
  end

  scenario 'user views all appointments on property page' do
    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user)
    appointment1 = FactoryGirl.create(:appointment, property: property)
    appointment2 = FactoryGirl.create(:appointment, property: property)
    appointment3 = FactoryGirl.create(:appointment, property: property)

    visit properties_path
    within('.panel-primary') do
        click_link('View')
    end
    expect(page).to have_content appointment1.visitor
    expect(page).to have_content appointment1.visitor_phone
    expect(page).to have_content appointment2.visitor
    expect(page).to have_content appointment2.visitor_phone
    expect(page).to have_content appointment3.visitor
    expect(page).to have_content appointment3.visitor_phone
  end
end
