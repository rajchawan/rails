class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.string :item_name
      t.integer :quantity
      t.decimal :price
      t.datetime :schedule_time

      t.timestamps
    end
  end
end
