ActiveAdmin.register Customer do

  index do
 	column :customer_name
  	column :customer_address
  	actions
  	end

  	show do |customer|
      attributes_table do
        row :customer_name
        row :customer_address
      end

    panel "Delivery Addresses" do 
      table do
        	tr do 
          	th "Address"
       end
        	customer.deliveryaddresses.each do |deliveryaddress|
        		tr do      
             	td deliveryaddress.delivery_address
          		end
        	end
        end
	end



      active_admin_comments
    end

    form do |f|
 		f.inputs "Details" do
        f.input :customer_name, :hint => "Name of customer"
        f.input :customer_address, :hint => "Office address of customer"   	
      end
    	f.has_many :deliveryaddresses do |deliveryaddress|
    	deliveryaddress.inputs "Delivery Addresses" do
    	deliveryaddress.input :delivery_address, as: :string
    	end
    end
    f.actions
end

  end

