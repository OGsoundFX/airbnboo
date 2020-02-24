class Property < ApplicationRecord
  belongs_to :user
  validates :name, :address, :price, :haunted_level, presence: true
end
