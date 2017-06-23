class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates_inclusion_of :rating, in: 1..5
  validates :content, length: { in: 0..20 }, allow_nil: true
  validates :user_id, presence: true
end
