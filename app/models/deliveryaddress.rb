class Deliveryaddress < ActiveRecord::Base
  attr_accessible :delivery_address, :customer_id

    validates :delivery_address,  :presence => true

    belongs_to :customer

      def to_s
		turntostring
	end

def turntostring
    "#{delivery_address} - #{customer}"
  end

end