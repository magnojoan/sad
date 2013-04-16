class Orderlist < ActiveRecord::Base
  attr_accessible :lot_id, :net_amount, :order_id, :orderlist_code, :quantity, :tin_no

  belongs_to :order 
  belongs_to :lot


#  after_save :pass_values

  def net_amount
    quantity*self.lot.product.unit_price
  end

#  def pass_values
#  	o = self.order
#  if o.subtotal.nil?
#    o.subtotal = 0
#  else
#  	o.subtotal += net_amount
#  	o.vatable_amount = o.subtotal*0.12
#  	o.total = o.subtotal + o.vatable_amount  
#   
# end
#  o.save
#  end

  def to_s
		turntostring
	end

def turntostring
    "Lot: #{lot_id} - ID: #{product_id} - #{quantity}"
  end

end
