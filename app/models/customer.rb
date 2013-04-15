class Customer < ActiveRecord::Base
  attr_accessible :customer_address, :customer_name, :deliveryaddresses_attributes

  validates :customer_address,  :presence => true
  validates :customer_name,  :presence => true, :uniqueness => {:case_sensitive => false}

	has_many :deliveryaddresses, dependent: :destroy
	has_many :orders, dependent: :restrict
accepts_nested_attributes_for :deliveryaddresses, :allow_destroy => true

	def to_s
		customer_name
	end

end
