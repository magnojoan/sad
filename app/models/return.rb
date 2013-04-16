class Return < Adjustment
	attr_accessible  :quantity_returned, :orderlist_id

belongs_to :orderlist
end
