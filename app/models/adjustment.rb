class Adjustment < ActiveRecord::Base
  attr_accessible :difference_amount, :month_in_effect, :price_difference_type, :product_id

  validates :product_id, :presence => true
  validates :price_difference_type, :presence => true
  validates :difference_amount, :presence => true, :numericality => true
  validates :month_in_effect, :presence => true

  belongs_to :product
end
