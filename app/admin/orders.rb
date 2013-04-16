ActiveAdmin.register Order do 

  form do |f|
      f.inputs "Details" do
        f.input :customer
        f.input :invoice_no
        f.input :purchase_order_no 
        f.input :date, :hint => "Date of order"
        f.input :terms, :hint => "Terms of the Transaction"
      end
      f.actions
    
  end

  index do |order|
    selectable_column
    column :purchase_order_no
    column "Date of Sale", :date
    column "Net Amount", :total
    column :invoice_no
    default_actions
  end

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

    panel "Orderlists" do 
      table do
        tr do 
          th "Code"
          th "Product"
          th "Expiry Date"
          th "Unit Price"
          th "Lot Number"
          th "Quantity"
          th "Net Amount"
          end
        order.orderlists.each do |x|
        tr do      
            
             td x.id
             td x.lot.product.product_name
             td x.lot.expiry_date
             td x.lot.product.unit_price
             td x.lot.lot_no
             td x.quantity
             td x.net_amount
          end


                  end
        end
end
end

    end