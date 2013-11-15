FactoryGirl.define do
  factory :income do
    user { FactoryGirl.create(:user, :confirmed) }
    currency { FactoryGirl.create(:currency) }

    date_in { Date.current }
    income_type "mine_job"
    amount 100
  end
end
