class Orderlist < ActiveRecord::Base
  attr_accessible :lot_id, :net_amount, :order_id, :orderlist_code, :quantity, :tin_no

  belongs_to :order 
  belongs_to :lot

  after_save :pass_values

  def pass_values
  	o = self.order
  if o.subtotal = nil
    o.subtotal = 0
  end

    o.subtotal = 0
  	o.subtotal += quantity
  	o.vatable_amount = o.subtotal*0.12
  	o.total = o.subtotal + o.vatable_amount
  	

    self.net_amount = self.lot.unit_cost * self.quantity
    o.save
  end


end
