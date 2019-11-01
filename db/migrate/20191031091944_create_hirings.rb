class CreateHirings < ActiveRecord::Migration[5.2]
  def change
    create_table :hirings do |t|
      t.references :user, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
