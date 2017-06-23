class Comment < ApplicationRecord
  belongs_to :restaurant

  validates_inclusion_of :rating, in: 1..5
  validates :content, length: { in: 0..20 }, allow_nil: true
end
