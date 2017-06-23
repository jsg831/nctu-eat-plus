class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :area
      t.string :location
      t.string :phone_number

      t.timestamps
    end
  end
end
