FactoryGirl.define do
  factory :outcome do
    user { FactoryGirl.create(:user, :confirmed) }
    currency { FactoryGirl.create(:currency) }

    date_out { Date.current }
    outcome_type "estate_leasing"
    amount 100
  end
end
