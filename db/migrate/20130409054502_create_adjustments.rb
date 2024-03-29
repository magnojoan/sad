class CreateAdjustments < ActiveRecord::Migration
  def change
    create_table :adjustments do |t|
      t.integer :product_id
      t.string :price_difference_type
      t.decimal :difference_amount
      t.date :month_in_effect
      t.integer :quantity_returned
      t.integer :orderlist_id

      t.timestamps
    end
  end
end
