class Property < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_address_and_name,
                  against: [:address, :name],
                  using: {
                    tsearch: { prefix: true },
                  }
  belongs_to :user
  has_many :reviews
  has_one_attached :photo
  validates :name, :address, :price, :haunted_level, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
