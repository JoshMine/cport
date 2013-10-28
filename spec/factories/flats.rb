# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flat do
    participant_id 1
    address ""
    rooms_quantity 1
    total_square 1.5
    living_square 1.5
    floor 1
    price 1.5
  end
end
