class Adjustment < ActiveRecord::Base
  attr_accessible :difference_amount, :entry_id, :month_in_effect, :price_difference_type, :product_id
end
