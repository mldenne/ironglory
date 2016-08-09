class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
