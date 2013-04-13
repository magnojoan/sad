class Lot < ActiveRecord::Base
  attr_accessible :expiry_date, :inventory_status, :lot_cost, :lot_no, :product_id, :quantity, :unit_cost

  belongs_to :product
  has_many :orderlists
  has_many :orders, :through => :orderlists

  def to_s
  	lot_no
  end

end
