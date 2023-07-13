class UserReview < ApplicationRecord
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
end
