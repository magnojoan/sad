class Orderlist < ActiveRecord::Base
  attr_accessible :lot_id, :net_amount, :order_id, :orderlist_code, :quantity, :tin_no

  belongs_to :order 
  belongs_to :lot

before_save :updateLots
before_destroy :updateDeleteLots
    validates :lot_id,  :presence => true
    validates :quantity,  :presence => true

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

def updateLots
  check = self.lot.quantity - self.quantity
  if check == 0
    self.lot.quantity = self.lot.quantity - self.quantity
    self.lot.inventory_status = "Inactive"
      self.lot.save

  elsif check > 0
        self.lot.quantity = self.lot.quantity - self.quantity
          self.lot.save
  else
    return false
  end
end

def afterDeleteLots
    self.lot.quantity += self.quantity
    self.lot.inventory_status = "Active"
    self.lot.save
end

def turntostring
    "Lot: #{lot_id} - Order: #{order_id} - #{quantity}"
  end

end
