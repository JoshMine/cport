# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive_license do
    series "MyString"
    number 1
    issuer "MyString"
    issue_date "2013-06-04"
    exp_date "2013-06-04"
  end
end
