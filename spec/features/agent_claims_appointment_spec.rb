require 'rails_helper'

feature 'agent signs in claim appointments', %Q{
  as agerng I want to be able to claim appointments
} do


  scenario "agent can claim appointments" do
    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user, zip_code: '02111')
    appointment1 = FactoryGirl.create(:appointment, property: property)
    appointment2 = FactoryGirl.create(:appointment, property: property)
    click_on 'Sign Out'


    visit new_user_session_path
    agent_user = FactoryGirl.create(:user, role: 'agent')
    agent = FactoryGirl.create(:agent_profile, user: agent_user, zip_code: '02111')
    sign_in_as(agent_user)
    first('.panel-default').click_link('Claim')


    within ".panel-success" do
      expect(page).to have_content property.address
      expect(page).to have_content appointment1.visitor_phone
      expect(page).to have_content appointment1.visitor
    end
  end

  scenario "agent can't see/claim appointments out of area" do
      user = FactoryGirl.create(:user, role: 'seller')
      sign_in_as(user)
      property = FactoryGirl.create(:property, user: user, state: 'NY', zip_code: '10306')
      appointment1 = FactoryGirl.create(:appointment, property: property)
      appointment2 = FactoryGirl.create(:appointment, property: property)
      click_on 'Sign Out'


      visit new_user_session_path
      agent_user = FactoryGirl.create(:user, role: 'agent')
      agent = FactoryGirl.create(:agent_profile, user: agent_user, zip_code: '02111')
      sign_in_as(agent_user)


      expect(page).not_to have_content property.address
      expect(page).not_to have_content property.zip_code
      expect(page).not_to have_content appointment1.meeting
  end

  scenario "agent can view appointment details by clicking view link" do
      user = FactoryGirl.create(:user, role: 'seller')
      sign_in_as(user)
      property = FactoryGirl.create(:property, user: user, zip_code: '02111')
      appointment1 = FactoryGirl.create(:appointment, property: property)
      appointment2 = FactoryGirl.create(:appointment, property: property)
      click_on 'Sign Out'


      visit new_user_session_path
      agent_user = FactoryGirl.create(:user, role: 'agent')
      agent = FactoryGirl.create(:agent_profile, user: agent_user, zip_code: '02111')
      sign_in_as(agent_user)
      first('.panel-default').click_link('Claim')


      within ".panel-success" do
         first('tbody').click_link('View')
      end

      expect(page).to have_content property.name
      expect(page).to have_content property.description
      expect(page).to have_content property.address
      expect(page).to have_content property.bedrooms
      expect(page).to have_content property.bathrooms
      expect(page).to have_content property.details
      expect(page).to have_content appointment1.visitor_phone
      expect(page).to have_content appointment1.visitor
      expect(page).to have_content appointment1.visitor_email
  end

  scenario "agent can view appointment details by clicking view link" do
    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user, zip_code: '02111')
    appointment1 = FactoryGirl.create(:appointment, property: property)
    appointment2 = FactoryGirl.create(:appointment, property: property)
    click_on 'Sign Out'


    visit new_user_session_path
    agent_user = FactoryGirl.create(:user, role: 'agent')
    agent = FactoryGirl.create(:agent_profile, user: agent_user, zip_code: '02111')
    sign_in_as(agent_user)
    first('.panel-default').click_link('Claim')
    click_on 'Sign Out'

    sign_in_as(user)
    within ".panel-success" do
      expect(page).to have_content agent_user.first_name
      expect(page).to have_content agent_user.last_name
    end
  end
end
