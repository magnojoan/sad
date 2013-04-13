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
        
        li link_to("Add orderlist", admin_order_orderlists_path(order))
      end
      active_admin_comments
    end
        index :download_links => [:pdf]




end
