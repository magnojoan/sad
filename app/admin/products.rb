ActiveAdmin.register Product do
    form :partial => "form"
   		index do
    		column :product_name

    		default_actions do
    		end
			action_item :only => :show do
    		link_to('View on site', post_path(post)) if post.published?
  			end

    	end

  end  