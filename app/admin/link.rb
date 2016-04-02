ActiveAdmin.register Link do
  # permit_params :link_name, :description, :url

  index do
  	column :link_name do |link|
  		link_to link.link_name, link.url, target: "blank"
  	end
  	column :category
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
