FactoryGirl.define do
  factory :appointment do
    sequence(:meeting) { |n| Time.zone.now + n.weeks }
    instructions '123 Main st.'
    visitor 'Michael Kaplan'
    visitor_phone '917-449-9878'
    visitor_email 'test@test.com'
    property
  end
end
