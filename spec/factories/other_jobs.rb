# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :other_job do
    company "MyString"
    position "MyString"
    start_date "2013-06-29"
    end_date "2013-06-29"
    description "MyString"
    monthly_income 1.5
  end
end
