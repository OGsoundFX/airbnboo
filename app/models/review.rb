class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :rating, inclusion: { in: (1..5) }
  validates :content, length: { minimum: 15 }
end
