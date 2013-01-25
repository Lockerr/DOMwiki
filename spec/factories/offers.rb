# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    company_id 1
    publish false
    header "MyString"
    advert "MyText"
    date_start "2013-01-23"
    date_end "2013-01-23"
    conditions "MyText"
  end
end
