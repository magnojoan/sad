class Deliveryaddress < ActiveRecord::Base
  attr_accessible :delivery_address

    validates :delivery_address,  :presence => trued

  belongs_to :customer
end