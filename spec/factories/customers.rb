FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name.gsub(/\W/, '') }
    last_name { Faker::Name.last_name.gsub(/\W/, '') }
    email { Faker::Internet.unique.email }
    age { Faker::Number.decimal_part(digits: 2) }
    date_of_birth { Faker::Date.birthday(min_age: 1, max_age: 99) }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
