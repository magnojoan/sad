ActiveAdmin.register Product do
    #form :partial => "form"
    
    form do |f|
      f.inputs "Details" do
        f.input :product_name
        f.input :product_code
        f.input :reorder_level
        f.input :effective_date
        f.input :unit_price
        f.input :unit_type, :as => :select, :label => "Unit Type:", :include_blank => false, :collection => ["Boxes", "Bottles"] 
        f.input :product_version, :as => :hidden, :wrapper_html => { :style => "display:none;" }
		f.input :is_enabled, :as => :hidden, :wrapper_html => { :style => "display:none;" }
      end
      f.actions
    end


  end  


