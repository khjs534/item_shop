class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :item
      t.references :order
      t.decimal :unit_price, precision: 5, scale: 2, default: 0
      t.integer :quantity
      t.decimal :total_price, precision: 5, scale: 2, default: 0
      t.timestamps
    end
  end
end
