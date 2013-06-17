# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :main_job do
    participant_id 1
    company "MyString"
    position "MyString"
    start_date "2013-06-14"
    end_date "2013-06-14"
    description "MyString"
    monthly_income 1.5
  end
end
