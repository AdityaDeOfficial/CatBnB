class AddColumnsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :end_date, :date
    add_column :bookings, :total_price, :integer
    add_column :bookings, :status, :string
    add_column :bookings, :user_id, :integer
  end
end
