class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :invoice_no
      t.integer :purchase_order_no
      t.date :date
      t.string :terms
      t.decimal :subtotal
      t.decimal :vatable_amount
      t.decimal :total

      t.timestamps
    end
  end
end
