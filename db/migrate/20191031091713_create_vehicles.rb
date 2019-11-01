class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :quantity
      t.boolean :active
      t.references :category, foreign_key: true
      t.references :branch, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
