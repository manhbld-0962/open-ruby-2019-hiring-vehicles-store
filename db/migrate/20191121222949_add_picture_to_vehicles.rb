class AddPictureToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :picture, :string
  end
end
