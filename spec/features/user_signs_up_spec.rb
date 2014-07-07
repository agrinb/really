require 'rails_helper'

feature 'user registers', %Q{
  as a user I want to register
} do

  scenario 'user registers successfully as seller' do

    user = FactoryGirl.build(:user)

    visit new_user_registration_path
    save_and_open_page
    fill_in 'first_name', with: 'user.first_name'
    fill_in 'Last name', with: 'user.last_name'
    fill_in 'Email', with: 'user.email'
    fill_in 'Year', with: '2000'
    fill_in 'Password', with: 'password1'
    fill_in 'Password Confirmation', with: 'password1'
    choose 'Seller'
    click_button 'Register'


    expect(page).to have_content 'Thanks, get ready to sell your house fast!'
  end


  scenario 'user registers successfully as agent' do

    user = FactoryGirl.build(:user)

    visit new_user_registration_path
    fill_in 'First name', with: 'user.first_name'
    fill_in 'Last name', with: 'user.last_name'
    fill_in 'Email', with: 'user.email'
    fill_in 'Year', with: '2000'
    fill_in 'Password', with: 'password1'
    fill_in 'Password Confirmation', with: 'password1'
    choose 'Agent'
    fill_in 'Zip code', with: '11235'
    fill_in 'Years of experience', with: '3'
    fill_in 'Profile', with: 'I love pets and snowboarding'
    fill_in 'from_hour', with: '10'
    fill_in 'to_hour', with: '8'
    click_button 'Register'


    expect(page).to have_content 'Thanks, your agent profile is complete.'
  end
end

