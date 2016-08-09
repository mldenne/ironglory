class MakeBillingAddressPolymorphic < ActiveRecord::Migration[5.0]
  def change
    rename_column :billing_addresses, :user_id, :can_be_billed_id
    add_column :billing_addresses, :can_be_billed_type, :string
  end
end
