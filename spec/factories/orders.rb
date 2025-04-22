FactoryBot.define do
  factory :order do
    CUSTOMER { nil }
    restaurant { nil }
    item_name { "MyString" }
    quantity { 1 }
    price { "9.99" }
    schedule_time { "2024-10-11 15:10:20" }
  end
end
