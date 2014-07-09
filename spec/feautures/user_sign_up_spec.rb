require 'rails_helper'

feature 'user registers', %Q{
  as a user I want to register
} do

  scenario 'user registers successfully as Seller' do

    #user = FactoryGirl.create(:user)

    visit new_user_registration_path
    within (".user_sign_up") do
    fill_in 'first_name', with: 'Mike'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'email@email.com'
    fill_in 'cell_phone', with: '555-666-9999'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    choose 'role_seller'
    click_button 'Register'
    end

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end


  scenario 'user registers successfully as agent' do

    user = FactoryGirl.build(:user)

    visit new_user_registration_path
    fill_in 'first_name', with: 'user.first_name'
    fill_in 'last_name', with: 'user.last_name'
    fill_in 'email', with: 'user.email'
    fill_in 'cell_phone', with: '456-789-9875'
    fill_in 'user_password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    choose 'role_agent'
    fill_in 'zip_code', with: '11235'
    fill_in 'years_of_experience', with: '3'
    fill_in 'description', with: 'I love pets and snowboarding'
    fill_in 'from_hour', with: '10'
    fill_in 'to_hour', with: '8'
    click_button 'Register'


    expect(page).to have_content 'Thanks, your agent profile is complete.'
  end

  scenario 'user registers with duplicate email' do

    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'first_name', with: 'Mike'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'user.email'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    choose 'role_seller'
    fill_in 'zip_code', with: '11235'
    fill_in 'years_of_experience', with: '3'
    fill_in 'description', with: 'I love pets and snowboarding'
    fill_in 'from_hour', with: '10'
    fill_in 'to_hour', with: '8'
    click_button 'Register'


    expect(page).to have_content 'Error'
  end

  scenario 'user registers with duplicate cell phone' do


    visit new_user_registration_path
    fill_in 'first_name', with: 'Mike'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'user9827@gmail.com'
    fill_in 'user_password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    fill_in 'cell_phone', with: 'user.cell_phone'
    choose 'role_agent'
    fill_in 'zip_code', with: '11235'
    fill_in 'years_of_experience', with: '3'
    fill_in 'description', with: 'I love pets and snowboarding'
    fill_in 'from_hour', with: '10'
    fill_in 'to_hour', with: '8'
    click_button 'Register'


    expect(page).to have_content 'Error'
  end

  scenario 'user is missing a field' do


    visit new_user_registration_path
    fill_in 'first_name', with: ''
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'user9827@gmail.com'
    fill_in 'user_password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    fill_in 'cell_phone', with: 'user.cell_phone'
    choose 'role_seller'
    fill_in 'zip_code', with: '11235'
    fill_in 'years_of_experience', with: '3'
    fill_in 'description', with: 'I love pets and snowboarding'
    fill_in 'from_hour', with: '10'
    fill_in 'to_hour', with: '8'
    click_button 'Register'


    expect(page).to have_content 'Error'
  end

end

