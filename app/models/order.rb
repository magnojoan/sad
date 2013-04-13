class Order < ActiveRecord::Base
  attr_accessible :date, :invoice_no, :purchase_order_no, :subtotal, :terms, :total, :vatable_amount

  belongs_to :customer
  has_many :orderlists
#Order.where('orders.date = ?', date)
end
