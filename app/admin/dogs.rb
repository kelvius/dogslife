ActiveAdmin.register Dog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :breed, :story, :photo_url, :price, :available_for_adoption
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :breed, :story, :photo_url, :price, :available_for_adoption]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # filter :dog_list_id_eq
  permit_params :name, :breed, :story, :photo_url, :price, :available_for_adoption
end
