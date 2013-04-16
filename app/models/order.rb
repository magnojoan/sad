class Order < ActiveRecord::Base
  attr_accessible :customer_id, :date, :invoice_no, :purchase_order_no, :subtotal, :terms, :total, :vatable_amount, :orderlists_attributes

  belongs_to :customer
  has_many :lots, :through => :orderlists

  has_many :orderlists, dependent: :restrict
  accepts_nested_attributes_for :orderlists, :allow_destroy => true

  validates :customer_id,  :presence => true
    validates :date,  :presence => true
  validates :invoice_no,  :presence => true
    validates :purchase_order_no,  :presence => true

	def to_s
"#{invoice_no}"
	end

	def subtotal
		orderlists.collect(&:net_amount).inject(&:+)
	end

	def vatable_amount
		subtotal*0.12
	end

	def total 
		subtotal+vatable_amount
	end

end

