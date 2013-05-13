# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_datum, :class => 'ContactData' do
    email "MyString"
    m_phone "MyString"
    w_phone "MyString"
    h_phone "MyString"
    f_address "MyString"
  end
end
