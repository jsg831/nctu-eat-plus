class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :restaurant
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
