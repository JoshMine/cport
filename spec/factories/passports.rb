# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passport do
    series 1234
    number 123456
    issuer "MyString"
    dep_code "MyString"
    issue_date "2013-05-21"
    last_name "MyString"
    first_name "MyString"
    middle_name "MyString"
    gender male
    birth_date "2013-05-21"
    birth_place "MyString"
  end
end
