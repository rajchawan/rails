class MenuItem < ApplicationRecord
  belongs_to :restaurant
  

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "item_name", "price", "restaurant_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["restaurant"]
  end
end
