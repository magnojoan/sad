ActiveAdmin.register Orderlist do
   belongs_to :order 
   form do |f|
      f.inputs "Details" do
  
       # f.input :product
        f.input :lot_id
        f.input :quantity
        f.input :tin_no, :label => "TIN No"
    
      end
      f.actions
    
  end
end
