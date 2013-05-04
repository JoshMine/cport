FactoryGirl.define do
  factory :user do
    name     "Иван Петров"
    email    "petrov@petrov.ru"
    password "foobar"
    password_confirmation "foobar"
  end
end
