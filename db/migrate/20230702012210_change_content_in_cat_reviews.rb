class ChangeContentInCatReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :cat_reviews, :content, :string
  end
end
