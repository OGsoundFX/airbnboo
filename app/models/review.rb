class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :rating, scope
  validates :content, length: { minimum: 15 }
end
