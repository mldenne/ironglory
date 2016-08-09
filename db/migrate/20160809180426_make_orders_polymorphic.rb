class MakeOrdersPolymorphic < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :can_order_id, :integer
    add_column :orders, :can_order_type, :string
  end
end
