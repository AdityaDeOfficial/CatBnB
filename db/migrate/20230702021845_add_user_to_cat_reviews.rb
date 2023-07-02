class AddUserToCatReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :cat_reviews, :user, null: false, foreign_key: true
  end
end
