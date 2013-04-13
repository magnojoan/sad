ActiveAdmin.register Order do
  show do |order|
      attributes_table do
        row :customer_id
        row :date
        row :invoice_no
        row :purchase_order_no
        row :subtotal
        row :terms
        row :total
        row :vatable_amount
        
   row :actions do
            link_to "Add Order List", admin_order_orderlists_path(order) 
        end

              end
      active_admin_comments
    end



end