class MakeShippingAddressesPolymorphic < ActiveRecord::Migration[5.0]
  def change
    add_column :shipping_addresses, :can_be_shipped_to_id, :integer
    add_column :shipping_addresses, :can_be_shipped_to_type, :string
  end
end
