class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_code
      t.integer :product_version
      t.string :product_name
      t.decimal :reorder_level
      t.boolean :is_enabled
      t.date :effective_date
      t.decimal :unit_price
      t.string :unit_type

      t.timestamps
    end
  end
end
