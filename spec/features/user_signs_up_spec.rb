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
      fill_in 'password', with: 'password15'
      fill_in 'password_confirmation', with: 'password15'
      choose 'user_role_seller'
      click_button 'Register'
    end

    expect(page).to_not have_content 'errors prohibited this user from being saved'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end


  scenario 'user registers with duplicate email' do

    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'first_name', with: 'Mike'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'user.email'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    fill_in 'zip_code', with: '11235'
    fill_in 'cell_phone', with: '555-666-9999'
    choose 'user_role_seller'
    click_button 'Register'


    expect(page).to have_content 'error'
  end

  scenario 'user registers with duplicate cell phone' do


    visit new_user_registration_path
    fill_in 'first_name', with: 'Mike'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'user9827@gmail.com'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    fill_in 'cell_phone', with: 'user.cell_phone'
    fill_in 'zip_code', with: '11235'
    choose 'user_role_seller'
    click_button 'Register'


    expect(page).to have_content 'error'
  end

  scenario 'user is missing a field' do


    visit new_user_registration_path
    fill_in 'first_name', with: ''
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'user9827@gmail.com'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    fill_in 'cell_phone', with: 'user.cell_phone'
    fill_in 'zip_code', with: '11235'
    choose 'user_role_seller'
    click_button 'Register'


    expect(page).to have_content 'error'
  end

end

