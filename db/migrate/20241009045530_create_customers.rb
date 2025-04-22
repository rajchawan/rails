class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :emial
      t.integer :age
      t.date :date_of_birth
      t.string :password

      t.timestamps
    end
  end
end
