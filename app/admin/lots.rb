ActiveAdmin.register Lot do
	scope :all, :default => true
  	scope :active do |lots|
    	lots.where(:inventory_status.downcase => "active")
  	end
  	scope :inactive do |lots|
    	lots.where(:inventory_status.downcase => "inactive")
  	end
  	scope :expired do |lots|
    	lots.where(:inventory_status.downcase => 'expired')
  	end

	actions :all, :except => [:show]

	filter :lot_no
	filter :product
	filter :expiry_date

  	index do
  		column :lot_no
	  	column :product
	  	column :unit_cost
	  	column :expiry_date
	  	column :quantity
	  	column :inventory_status
	  	column "Added On", :created_at
		  default_actions
  	end

  	form do |f|
  		f.inputs "Restock Inventory" do
  			f.input :product, :hint => "The product to be replenished"
  			f.input :lot_no, :hint => "The inventory bin of the product"
	     	f.input :quantity, :hint => "Quantity to be added"
	     	f.input :expiry_date, :hint => "Date that the inventory will expire"
        f.input :inventory_status, :hint => "Active/Inactive/Expired", :as => :select, :label => "Unit Type:", :include_blank => false, :collection => ["Active", "Inactive", "Expired"] 
	   	end
	  	f.actions
	end

	action_item :only => :show do
      link_to 'Print Inventory Report', print_path(params[:id]), :target=>"_blank"
    end
end
