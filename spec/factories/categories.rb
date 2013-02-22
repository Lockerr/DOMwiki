# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
  end
  factory :user do
  end

  factory :admin, class: User do
    email 'antiqe@gmail.com'
    password '12345qwert'
    password_confirmation '12345qwert'
  end
end
