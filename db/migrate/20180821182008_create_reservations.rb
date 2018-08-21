class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :time
      t.integer :party_size
      t.references :user
      t.references :restaurant

      t.timestamps
    end
  end
end
