require 'rails_helper'

feature 'user signs in to create property', %Q{
  as a user I want to register
} do

  scenario 'seller signs in to create property and appointment' do

    user = FactoryGirl.create(:user, role: 'seller')
    sign_in_as(user)
    expect(page).to have_content 'Create property'
    expect(page).to have_content 'Create appointment'
  end


  scenario "agent can't creates a property" do

    agent = FactoryGirl.create(:user, role: 'agent')
    sign_in_as(agent)

    expect(page).not_to have_content 'Create property'
    expect(page).not_to have_content 'Create appointment'
    expect(page).to have_content 'View appointments'
  end
end
