class CreateOrderings < ActiveRecord::Migration[5.0]
  def change
    create_table :orderings do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
