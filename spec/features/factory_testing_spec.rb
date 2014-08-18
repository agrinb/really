require 'rails_helper'

feature 'user signs in to create property', %Q{
  as a user I want to register
} do



  scenario "agent can't create a property" do
    user1 = FactoryGirl.create(:user, role: 'agent')
    agent = FactoryGirl.create(:agent_profile, user: user1)
    user = agent.user
    sign_in_as(user)

    expect(page).not_to have_content 'New Property'
    expect(page).to have_content 'Available appointments in your area:'
  end
end
