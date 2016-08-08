class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :price
      t.integer :inventory
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
