class Review < ApplicationRecord
  belongs_to :restaurant

  # A review must have a content and rating.
  validates :rating, :content, presence: true
  # A review’s rating must be an integer between 0 and 5.
  validates :rating, numericality: { only_integer: true , in: 0..5 }
end
