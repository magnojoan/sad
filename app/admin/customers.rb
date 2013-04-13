ActiveAdmin.register Customer do
  show do |customer|
      attributes_table do
        row :customer_name
        row :customer_address
        li link_to("Delivery Addresses", admin_customer_deliveryaddresses_path(customer))
      end
      active_admin_comments
    end
  end

