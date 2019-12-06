class AddGiveBackTimeToHirings < ActiveRecord::Migration[5.2]
  def change
    add_column :hirings, :give_back_time, :timestamp
  end
end
