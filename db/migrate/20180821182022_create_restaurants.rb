class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :opening_hour
      t.integer :closing_hour
      t.integer :max_capacity

      t.timestamps
    end
  end
end
