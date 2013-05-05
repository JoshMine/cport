FactoryGirl.define do
  factory :user do
    name     "Ivan Petrov"
    email    "petrov@petrov.ru"
    password "foobar"
    password_confirmation "foobar"
  end
end
