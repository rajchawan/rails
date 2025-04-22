class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :star
      t.string :cuisine
      t.time :openinig_time
      t.time :closing_time

      t.timestamps
    end
  end
end
