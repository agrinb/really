require 'rails_helper'

feature 'user sees agent details when appointment is claimed', %Q{
  user sees details when appointment is claimed
} do


  scenario "user sees agent details when appointment is claimed" do
    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user, zip_code: '02111')
    appointment1 = FactoryGirl.create(:appointment, property: property)
    click_on 'Sign Out'


    visit new_user_session_path
    agent_user = FactoryGirl.create(:user, role: 'agent')
    agent = FactoryGirl.create(:agent_profile, user: agent_user, zip_code: '02111')
    sign_in_as(agent_user)
    first('.panel-default').click_link('Claim')
    click_on 'Sign Out'

    sign_in_as(user)
    within('.panel-primary') do
      click_link('View')
    end

    within('.panel-success') do
      expect(page).to have_content agent_user.first_name
      expect(page).to have_content agent_user.cell_phone
    end
  end
end
