class AddRestaurantAndPrice < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :address, :string
    add_column :restaurants, :price_range, :string
  end

  def down
    remove_column :restaurants, :address
    remove_column :restaurants, :price_range
  end
end
