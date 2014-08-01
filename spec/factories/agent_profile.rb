# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent_profile do
    realty 'House be gone'
    description 'Best real estate agent'
    zip_code '02111'
    radius '10'
    from_hour '8AM'
    to_hour '10PM'

  end
end
