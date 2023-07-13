class AddUsernameAndAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :avatar, :string
  end
end
