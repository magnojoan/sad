ActiveAdmin.register Product do    


  scope :all, :default => true
  scope :enabled do |products|
    products.where(:is_enabled => true)
  end
  scope :disabled do |products|
    products.where(:is_enabled => false)
  end

 # index :as => :grid do |product|
 #    div do
 #      a :href => admin_product_path(product) do
 #        image_tag(product.avatar.url(:thumb))
 #      end
 #    ul do
 #      "Hello"
 #      a truncate(product.product_name), :href => admin_product_path(product)
 #      li number_to_currency product.unit_price
 #      li product.is_enabled
 #  end
 #  end
# end


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
        f.input :avatar
      end
      f.actions
    end
    
      batch_action :enable do |selection|
        Product.find(selection).each do |a|
          a.is_enabled = true
                  a.save
        end
 redirect_to :back    end

  batch_action :disable do |selection|
        Product.find(selection).each do |a|
          a.is_enabled = false
          a.save
        end
 redirect_to :back    end

  
  


  end  
