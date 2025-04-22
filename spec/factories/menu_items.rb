FactoryBot.define do
  factory :menu_item do
    item_name { Faker::Food.dish }
    price { Faker::Number.decimal_part(digits: 3) }
    restaurant
  end
end
