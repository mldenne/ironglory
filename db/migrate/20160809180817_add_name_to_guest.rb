class AddNameToGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :name, :string, default: "Guest"
  end
end
