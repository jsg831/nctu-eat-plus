class Restaurant < ApplicationRecord
  has_many :foods
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates :area, presence: true, inclusion: { in: ["校內", "清夜", "城隍廟"] }
  validates :phone_number, numericality: true, uniqueness: true, length: { in: 9..10 }, allow_nil: true
end
