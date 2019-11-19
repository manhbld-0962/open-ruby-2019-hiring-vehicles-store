class AddStatusToHirings < ActiveRecord::Migration[5.2]
  def change
    add_column :hirings, :status, :integer, default: 0
  end
end
