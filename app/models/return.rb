class Return < Adjustment
	attr_accessible  :quantity_returned, :orderlist_id

belongs_to :orderlist

def turntostring
    "#{price_difference_type} - #{difference_amount}"
  end
  
end
