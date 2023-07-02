class ChangeContentInUserReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :user_reviews, :content, :string
  end
end
