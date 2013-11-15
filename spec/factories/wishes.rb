# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wish do
    user { FactoryGirl.create(:user, :confirmed) }
    currency { FactoryGirl.create(:currency) }

    name "MyString"
    amount 100
    need_amount 99
    final_date "2013-11-15"
  end
end
