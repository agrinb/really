require 'rails_helper'

feature 'user signs in to create property', %Q{
  as a user I want to register
} do

  scenario 'seller signs in to create property and appointment' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    expect(page).to have_content 'New Property'
    expect(page).to have_content 'Upcoming Appointments'
  end


  scenario "agent can't create a property" do
    user1 = FactoryGirl.create(:user, role: 'agent')
    agent = FactoryGirl.create(:agent_profile, user: user1)
    user = agent.user
    sign_in_as(user)

    expect(page).not_to have_content 'New Property'
    expect(page).to have_content 'Available appointments in your area:'
  end

  scenario 'seller signs in to create property and appointment' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    click_on 'New Property'
    expect(page).to have_content 'Create Your Property'
  end

  scenario 'seller signs in and creates property' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    click_on 'New Property'
    fill_in 'title', with: 'Beautiful Two Bedroom'
    fill_in 'description', with: 'Overlooks that amazing bridge.'
    fill_in 'address', with: '123 Main st.'
    fill_in 'property_city', with: 'Boston'
    fill_in 'property_state', with: 'WY'
    fill_in 'property_zip_code', with: '99999'
    fill_in 'property_bedrooms', with: '4'
    fill_in 'property_bathrooms', with: '5'
    fill_in 'property_details', with: "New kitchen and bathroom"
    attach_file('property_photo', File.join(Rails.root, '/spec/support/default.jpg'))
    click_on 'Create Property'

    expect(page).to have_content "Congratulations! You've just listed your property!"
    expect(page).to have_content "Listed Properties"
  end

   scenario 'seller leaves out required field when creating property' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    click_on 'New Property'
    fill_in 'title', with: 'Beautiful Two Bedroom'
    fill_in 'description', with: 'Overlooks that amazing bridge.'
    fill_in 'address', with: ''
    fill_in 'property_city', with: 'Boston'
    fill_in 'property_state', with: 'WY'
    fill_in 'property_zip_code', with: '99999'
    fill_in 'property_bedrooms', with: '4'
    fill_in 'property_bathrooms', with: '5'
    fill_in 'property_details', with: "New kitchen and bathroom"
    attach_file('property_photo', File.join(Rails.root, '/spec/support/default.jpg'))
    click_on 'Create Property'

    expect(page).to have_content "Your property could not be saved!"
  end

  scenario 'seller signs in and creates property' do

    user = FactoryGirl.create(:user, role: 'seller')
    prop = FactoryGirl.create(:property, user: user)
    prop2 = FactoryGirl.create(:property, user: user)
    prop3 = FactoryGirl.create(:property, user: user)
    sign_in_as(user)


    expect(page).to have_content prop.name
    expect(page).to have_content prop2.name
    expect(page).to have_content prop3.name
    expect(page).to have_content prop.zip_code
    expect(page).to have_content prop2.zip_code
    expect(page).to have_content prop3.zip_code
    expect(page).to have_content "Listed Properties"
  end

   scenario 'seller wants to edit property' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    property = FactoryGirl.create(:property, user: user)
    visit properties_path
    click_on "Edit"

    expect(page).to have_content 'Edit Your Property'
    expect(page).to have_content 'Add a Photo'
  end
end
