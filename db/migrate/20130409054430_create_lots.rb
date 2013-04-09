class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :lot_no
      t.integer :product_id
      t.date :expiry_date
      t.string :inventory_status
      t.integer :quantity
      t.decimal :lot_cost
      t.decimal :unit_cost

      t.timestamps
    end
  end
end
