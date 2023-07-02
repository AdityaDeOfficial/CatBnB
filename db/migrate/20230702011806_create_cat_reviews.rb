class CreateCatReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :cat_reviews do |t|
      t.integer :rating
      t.text :content
      t.references :cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
