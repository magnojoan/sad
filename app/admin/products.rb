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

show do |product|
      attributes_table do
        row :product_code
        row :product_name
        row :reorder_level
        row :effective_date
        row :unit_price
        row :unit_type
        row :avatar do
          image_tag(product.avatar.url(:medium))
        end
      end
      active_admin_comments
    end



index do

div do
 h5 "You may add or edit products here. Adding a new product with the same code will add a new version of that product."

end
  selectable_column
  column :product_code
  column :product_version
  column :product_name
  column :unit_price
  column "Image" do |product|
    image_tag(product.avatar.url(:thumb))
  end
  actions
  end


    form do |f|
      f.inputs "Details" do
        f.input :product_code, :hint => "The identifying code of the product"
        f.input :product_name, :hint => "Proper name of the product"
        f.input :reorder_level, :hint => "Quantity of lots that will alert the user to order more"
        f.input :effective_date, :hint => "Date that the product will get in effect"
        f.input :unit_price, :hint => "Unit price of the product"
        f.input :unit_type, :as => :select, :label => "Unit Type:", :include_blank => false, :collection => ["Boxes", "Bottles", "Vials"] 
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
