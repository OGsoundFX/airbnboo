class Property < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :photo
  validates :name, :address, :price, :haunted_level, presence: true
end
