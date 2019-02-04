FactoryGirl.define do

  factory :user do
    password = Faker::Internet.password(8)
    nickname               Faker::Pokemon.name
    email                  Faker::Internet.free_email
    password               password
    password_confirmation  password
    last_name              Faker::Pokemon.name
    first_name             Faker::Pokemon.name
    last_name_kana         Faker::Pokemon.name
    first_name_kana        Faker::Pokemon.name
    phone_number           000011112222
  end

end
