class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :property
  belongs_to :booking
end
