class ChangingTimeDataTypeIntegerToTime < ActiveRecord::Migration[5.2]
  def up
    change_column :restaurants, :opening_hour, :time
    change_column :restaurants, :closing_hour, :time
    change_column :reservations, :time, :time
    change_column :reservations, :date, :date

  end

  def down
    change_column :restaurants, :opening_hour, :integer
    change_column :restaurants, :closing_hour, :integer
    change_column :reservations, :time, :string
    change_column :reservations, :date, :string
  end
end
