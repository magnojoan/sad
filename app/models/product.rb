class Product < ActiveRecord::Base
  attr_accessible :effective_date, :is_enabled, :product_code, :product_name, :product_version, :reorder_level, :unit_price, :unit_type

  has_many :lots
  has_many :adjustments

   validates :product_code, :presence => true
   validates :product_version, :presence => true
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
    # since you're creating a new product record even on update
    self.id = nil
    previous_product_version = Product.first # or Product.last. I forgot. lol
    self.product_version = previous_product_version + 1
end


end
