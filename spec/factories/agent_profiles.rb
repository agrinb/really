# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent_profile do
    user_agent_profile_attributes_realty 'House be gone'
    user_agent_profile_attributes_description 'Best real estate agent'
    user_agent_profile_attributes_zip_codev '02111'
    user_agent_profile_attributes_radius '10'
    user_agent_profile_attributes_from_hour '8AM'
    user_agent_profile_attributes_to_hour '10PM'

    user
  end
end
