class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
