FactoryGirl.define do
  factory :user do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    username Faker::Internet.user_name
    email Faker::Internet.safe_email
    address Faker::Address.street_name
    zip Faker::Address.zip
  end
end
