# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    participant_id 1
    brand "MyString"
    model "MyString"
    prod_year 1
    price 1.5
    photo ""
  end
end
