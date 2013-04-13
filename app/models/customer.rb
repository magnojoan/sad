class Customer < ActiveRecord::Base
  attr_accessible :customer_address, :customer_name

  validates :customer_address,  :presence => true
  validates :customer_name,  :presence => true, :uniqueness => {:case_sensitive => false}

	has_many :deliveryaddresses 
	has_many :orders

	def to_s
		customer_name
	end

end
