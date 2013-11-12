# encoding: utf-8

FactoryGirl.define do
  factory :currency do
    name "USD"
    symbol "$"
    enabled true

    trait :rub do
      name "RUB"
      symbol "руб"
    end


  end


end
