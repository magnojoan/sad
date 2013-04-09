class Order < ActiveRecord::Base
  attr_accessible :date, :invoice_no, :purchase_order_no, :subtotal, :terms, :total, :vatable_amount
end
