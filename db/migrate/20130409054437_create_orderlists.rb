class CreateOrderlists < ActiveRecord::Migration
  def change
    create_table :orderlists do |t|
      t.integer :order_id
      t.integer :lot_id
      t.integer :quantity
      t.string :tin_no
      t.decimal :net_amount

      t.timestamps
    end
  end
end
