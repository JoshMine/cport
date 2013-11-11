FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    sequence(:email) { |n| "#{n}"+Faker::Internet.email }
    password "123456abc!ABC"
    password_confirmation "123456abc!ABC"
    sign_in_count 1

    trait :confirmed do
      confirmed_at { Time.now }
    end

    trait :not_confirmed do
      confirmed_at nil
    end
  end
end
