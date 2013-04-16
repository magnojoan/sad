class Return < Adjustment
	attr_accessible  :quantity_returned, :orderlist_id

belongs_to :orderlist

def turntostring
    "#{price_difference_type} - #{product_id} - #{difference_amount}"
  end
  
end
