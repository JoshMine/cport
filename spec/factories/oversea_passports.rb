# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :oversea_passport do
    series 1
    number 1
    issuer "MyString"
    issue_date "2013-06-05"
    exp_date "2013-06-05"
    last_name "MyString"
    first_name "MyString"
    status 1
    doc_file ""
  end
end
