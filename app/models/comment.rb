class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  before_destroy :subtract_restaurant_rating
  after_create :add_restaurant_rating

  validates_inclusion_of :rating, in: 1..5
  validates :content, length: { in: 0..20 }, allow_nil: true
  validates :user_id, presence: true

  private

  def update_rating(new_rating)
    restaurant = Restaurant.find(self.restaurant_id)
    restaurant.rating_sum -= self.rating
    self.rating = new_rating
    restaurant.rating_sum += self.rating
    restaurant.avg_rating = restaurant.rating_sum.to_f / restaurant.comments.count
    self.save
    restaurant.save
  end

  def subtract_restaurant_rating
    restaurant = Restaurant.find(self.restaurant_id)
    restaurant.rating_sum -= self.rating
    restaurant.avg_rating = restaurant.rating_sum.to_f / restaurant.comments.count
    restaurant.save
  end

  def add_restaurant_rating
    restaurant = Restaurant.find(self.restaurant_id)
    restaurant.rating_sum += self.rating
    restaurant.avg_rating = restaurant.rating_sum.to_f / restaurant.comments.count
    restaurant.save
  end
end
