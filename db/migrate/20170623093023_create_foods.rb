class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.references :restaurant
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
