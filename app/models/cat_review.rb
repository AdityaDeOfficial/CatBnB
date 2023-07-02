class CatReview < ApplicationRecord
  belongs_to :cat
  belongs_to :user
end
