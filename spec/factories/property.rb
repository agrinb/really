FactoryGirl.define do
  factory :property do
    sequence :name do |n|
      "Beautiful Two Bedroom #{n}"
    end
    description 'Overlooks that amazing bridge.'
    address '123 Main st.'
    city 'Boston'
    state 'MA'
    zip_code '02111'
    bedrooms '4'
    bathrooms '5'
    details "New kitchen and bathroom"

    user
  end
end


