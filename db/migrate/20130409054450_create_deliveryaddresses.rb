class CreateDeliveryaddresses < ActiveRecord::Migration
  def change
    create_table :deliveryaddresses do |t|
      t.string :delivery_address
      t.integer :customer_id

      t.timestamps
    end
  end
end
