# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loan do
    user { FactoryGirl.create(:user, :confirmed) }
    category "mortgage"
    loan_type "differentiated"
    amount 1
    term 1
    issue_date "2013-11-12 09:40:02"
    monthly_payment 1
    rate "9.99"
    date_payment 1
  end
end
