class Product < ActiveRecord::Base
  attr_accessible :effective_date, :is_enabled, :product_code, :product_name, :product_version, :reorder_level, :unit_price, :unit_type

  has_many :lots
  has_many :adjustments

   validates :product_code, :presence => true
   validates :product_name, :presence => true
   validates :reorder_level, :presence => true, :numericality => true
   validates :effective_date, :presence => true
   validates :unit_price, :presence => true, :numericality => true
   validates :unit_type, :presence => true

	def to_s
		product_name
	end

  before_save :add_version

def add_version
   
    check = Product.first
    if check.blank?
      self.product_version = 1
    else
    previous_product_version = Product.first.product_version
    self.product_version = previous_product_version + 1
  end
end


end

