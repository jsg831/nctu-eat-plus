class AddRatingToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :rating_sum, :integer, default: 0
    add_column :restaurants, :avg_rating, :double, default: 0

    add_index :restaurants, :avg_rating, order: { avg_rating: :desc }
  end
end
