class ChangeMicroColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :cats, :microchip_number, :string
  end
end
