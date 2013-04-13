class Order < ActiveRecord::Base
  attr_accessible :customer_id, :date, :invoice_no, :purchase_order_no, :subtotal, :terms, :total, :vatable_amount

  belongs_to :customer
  has_many :lots, :through => :orderlists
  has_many :orderlists
#Order.where('orders.date = ?', date)
end
