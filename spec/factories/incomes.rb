# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :income do
    user { FactoryGirl.create(:user, :confirmed) }
    currency { FactoryGirl.create(:currency) }

    date_in "2013-11-13"
    income_type "mine_job"
    amount 1
  end
end
