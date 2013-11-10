# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :f_income, :class => 'FIncomes' do
    year 1
    month 1
    main_job 1.5
    secondary_job 1.5
    bussiness 1.5
    estate_rental 1.5
    other_incomes 1.5
    food 1.5
    goods 1.5
    car 1.5
    estate_rental_payment 1.5
    education 1.5
    other_outcomes 1.5
  end
end
