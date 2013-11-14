FactoryGirl.define do
  factory :outcome do
    user { FactoryGirl.create(:user, :confirmed) }
    currency { FactoryGirl.create(:currency) }

    date_out "2013-11-14"
    outcome_type "estate_leasing"
    amount 100
  end
end