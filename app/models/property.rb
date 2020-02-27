class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :address, :price, :haunted_level, presence: true
  geocoded_by :address 
  after_validation :geocode, if: :will_save_change_to_address?
end
