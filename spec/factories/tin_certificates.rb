# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tin_certificate do
    tin "MyString"
    doc_file ""
  end
end
