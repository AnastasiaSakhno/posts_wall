FactoryGirl.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }

    initialize_with { new(attributes) }
  end

  trait :admin do
    admin true
  end
end