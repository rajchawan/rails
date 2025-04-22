class Restaurant < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :order, dependent: :destroy


  def self.ransackable_attributes(auth_object = nil)
    ["closing_time", "created_at", "cuisine", "id", "id_value", "name", "openinig_time", "star", "updated_at"]
  end
end
