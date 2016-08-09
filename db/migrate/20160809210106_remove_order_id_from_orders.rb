class RemoveOrderIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :order_id
  end
end
