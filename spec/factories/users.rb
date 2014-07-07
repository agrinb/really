# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password "supersecret"
    first_name "Mike"
    last_name "Jones"
    role "seller"
    sequence(:cell_phone) { |n| "#{n}23-456-7890" }
  end
end
