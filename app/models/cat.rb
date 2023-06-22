class Cat < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos #trace: this probably gonna cause error 22jun2023
end
