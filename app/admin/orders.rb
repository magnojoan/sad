ActiveAdmin.register Order do 

  form do |f|
      f.inputs "Details" do
        f.input :customer
        f.input :invoice_no
        f.input :purchase_order_no 
        f.input :date, :hint => "Date of order"
        f.input :terms, :hint => "Terms of the Transaction"
      end

      f.has_many :orderlists do |ol_f|
  
        ol_f.inputs "Details" do
    
        ol_f.input :lot
        ol_f.input :quantity
        ol_f.input :tin_no, :label => "TIN No"
    

      end



    end

      f.actions
    
  end

  index do |order|
    selectable_column
    column :purchase_order_no
    column "Date of Sale", :date
    column "Total Amount", :total
    column :invoice_no
    default_actions
  end

  show do |order|
      attributes_table do
        row :customer_id
        row :date
        row :invoice_no
        row :purchase_order_no
        row :terms
#        row :subtotal
#        row :vatable_amount
#        row :total


   
        
   
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
            
             td x.lot.product.product_code
             td x.lot.product.product_name
             td x.lot.expiry_date
             td number_with_precision(x.lot.product.unit_price, :precision=>2)
             td x.lot.lot_no
             td x.quantity
             td number_with_precision(x.net_amount, :precision=>2)
          end


                  end
        end
end



  panel "Totals" do 
         table do
          tr do
              td "TOTAL SALES"
              if order.subtotal.nil?
              td ""
              else
              td "PHP " + number_with_precision(order.subtotal, :precision=>2)
              end
              td
              td
              td
              td
              td
              
          end
          tr do
            td "ADD 12% VAT"
             if order.subtotal.nil?
              td ""
              else
              td "PHP " + number_with_precision(order.vatable_amount, :precision=>2)
              end
            td
            td
            td
            td
              td
          end

          tr do
              td "TOTAL AMOUNT"
               if order.subtotal.nil?
              td ""
              else
              td "PHP " + number_with_precision(order.total, :precision=>2)
              end
              td
              td
              td
              td
              td
          end
        end
     end


end 


   
    action_item :only => :show do
      link_to 'Print Invoice', print_path(params[:id]), :target=>"_blank"
    end

    end