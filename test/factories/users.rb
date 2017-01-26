FactoryGirl.define do
  factory :user do
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    username {Faker::Internet.user_name + rand(1000).to_s}
    email {Faker::Internet.safe_email + rand(1000).to_s}
    address {(Faker::Address.street_name + " " + 11.to_s)}
    zip {Faker::Address.zip}
  end
end
