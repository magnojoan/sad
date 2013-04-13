class Return < Adjustment
	attr_acessible  :quantity_returned, :orderlist_id

	has_many :orderlists
end
