class Product < ActiveRecord::Base
  attr_accessible :effective_date, :is_enabled, :product_code, :product_name, :product_version, :reorder_level, :unit_price, :unit_type, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  has_many :lots
  has_many :adjustments

   validates :product_code, :presence => true
   validates :product_name, :presence => true
   validates :reorder_level, :presence => true, :numericality => true
   validates :effective_date, :presence => true
   validates :unit_price, :presence => true, :numericality => true
   validates :unit_type, :presence => true
validates_attachment :avatar, :content_type => { :content_type => ["image/jpg", "image/png", "image/jpeg"] } 

	def to_s
		product_name
	end

  before_create :add_version
  before_save :enableToTrue

  def enableToTrue
    self.is_enabled = true    
  end

def add_version
if Product.where(["product_code = ?", product_code]).last.blank?
self.product_version = 1
else
self.id = nil
previous_product_version = Product.where(["product_code = ?", product_code]).last.product_version
self.product_version = previous_product_version + 1
end
end



end

