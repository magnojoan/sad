class Lot < ActiveRecord::Base
  attr_accessible :expiry_date, :inventory_status, :lot_cost, :lot_no, :product_id, :quantity, :unit_cost

  before_update :get_unit_cost
  before_save :get_unit_cost

  belongs_to :product
  has_many :orderlists, dependent: :restrict
  has_many :orders, :through => :orderlists

  validates :product,:presence => true
  validates :lot_no, :presence => true
  validates :quantity, :presence => true, :numericality => true
  validates :expiry_date, :presence => true

  def to_s
  	lot_no
  end

  after_save :docheck

  def docheck
    if self.expiry_date < DateTime.now
      self.inventory_status == "Expired"
    end
  end

  def get_unit_cost
  	self.unit_cost = self.product.unit_price
  end
end
