class AddPriceToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :price, :integer
  end
end
