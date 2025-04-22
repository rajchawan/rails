FactoryBot.define do
  factory :order_item do
    order { nil }
    menu_item { nil }
    menu_item_id { 1 }
    quantitiy { 1 }
  end
end
