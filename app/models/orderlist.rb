class Orderlist < ActiveRecord::Base
  attr_accessible :lot_id, :net_amount, :order_id, :orderlist_code, :quantity, :tin_no
belongs_to :order 
  belongs_to :lot
end
