require 'rails_helper'

feature 'agent signs in claim appointments', %Q{
  as agerng I want to be able to claim appointments
} do


  scenario "agent can claim appointments" do
    #in_browser(:one) do

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
end
