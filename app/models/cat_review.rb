class CatReview < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
end
