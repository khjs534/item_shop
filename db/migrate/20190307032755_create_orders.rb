class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 5, scale: 2, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
