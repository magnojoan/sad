class CreateDeliveryaddresses < ActiveRecord::Migration
  def change
    create_table :deliveryaddresses do |t|
      t.integer :delivery_address_id
      t.string :delivery_address

      t.timestamps
    end
  end
end
