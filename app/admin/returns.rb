ActiveAdmin.register Return do  

scope :all, :default => true
scope :sales_returns do |adjustments|
	adjustments.where(:price_difference_type => "Sales Returns")
end
scope :senior_citizen_discount do |adjustments|
	adjustments.where(:price_difference_type => "Senior Citizen's Discount")
end
scope :sales_discount do |adjustments|
	adjustments.where(:price_difference_type => "Sales Discounts")
end


	form do |f|
      f.inputs "Returns" do
        f.input :orderlist, :hint => "The identifying code of the orderlist"
#      	f.input :product, :hint => "The identifying code of the product"
      	f.input :price_difference_type, :as => :select, :label => "Difference Type:", :include_blank => false, :collection => ["Sales Returns", "Senior Citizen's Discount", "Sales Discounts"] 
        f.input :difference_amount, :hint => "The difference made by the adjustments to the price" 
        f.input :month_in_effect, :hint => "Month wherein the adjusting entry will take effect"
      	f.input :quantity_returned, :hint => "Returned amount"
      end
      f.actions
    end

end