class Lot < ActiveRecord::Base
  attr_accessible :expiry_date, :inventory_status, :lot_cost, :lot_no, :product_id, :quantity, :unit_cost
end
