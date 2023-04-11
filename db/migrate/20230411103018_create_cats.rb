class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :gender
      t.integer :age
      t.string :breed
      t.integer :microchip_number
      t.string :photo_url
      t.string :address
      t.string :color
      t.string :temperament
      t.string :description

      t.timestamps
    end
  end
end
