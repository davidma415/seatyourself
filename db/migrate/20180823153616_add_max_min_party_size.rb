class AddMaxMinPartySize < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :max_party_size, :integer
    add_column :restaurants, :min_party_size, :integer
  end

  def down
    remove_column :restaurants, :max_party_size
    remove_column :restaurants, :min_party_size
  end
end
