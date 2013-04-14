ActiveAdmin.register Product do    
    form do |f|
      f.inputs "Details" do
        f.input :product_code, :hint => "The identifying code of the product"
        f.input :product_name, :hint => "Proper name of the product"
        f.input :reorder_level, :hint => "Quantity of lots that will alert the user to order more"
        f.input :effective_date, :hint => "Date that the product will get in effect"
        f.input :unit_price, :hint => "Unit price of the product"
        f.input :unit_type, :as => :select, :label => "Unit Type:", :include_blank => false, :collection => ["Boxes", "Bottles"] 
        f.input :product_version, :as => :hidden, :wrapper_html => { :style => "display:none;" }
		    f.input :is_enabled, :as => :hidden, :wrapper_html => { :style => "display:none;" }
      end
      f.actions
    end

    index do
      column :product_code
      column :product_name
      column :unit_price
      column :product_version
      column :is_enabled

      default_actions
    end
    
    #  link_to "Disable", admin_product_path(product), :method => :disable

  end  

