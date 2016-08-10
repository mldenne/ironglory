class AddGuestNumToGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :guest_num, :integer
  end
end
