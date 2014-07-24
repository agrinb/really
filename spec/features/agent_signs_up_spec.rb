require 'rails_helper'

feature 'agent registers', %Q{
  as an agent I want to register to get appointments
} do

  scenario 'user registers successfully as Seller' do

    #user = FactoryGirl.create(:user)

    visit new_user_registration_path
    within (".user_sign_up") do
      fill_in 'first_name', with: 'Mike'
      fill_in 'last_name', with: 'Jones'
      fill_in 'email', with: 'email@email.com'
      fill_in 'cell_phone', with: '555-666-9999'
      fill_in 'password', with: 'password15'
      fill_in 'password_confirmation', with: 'password15'
      choose 'user_role_agent'
      fill_in 'realty', with: 'Exit Realty'
      fill_in 'agent_profile', with: 'Best in Boston'
      fill_in 'zip_code', with: '55555'
      select '20', from: 'user_agent_profile_attributes_radius'
      fill_in 'from_hour', with: '3'
      fill_in 'to_hour', with: '3'

      click_button 'Register'
    end

    expect(page).to_not have_content 'errors prohibited this user from being saved'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
