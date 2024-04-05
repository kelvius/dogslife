ActiveAdmin.register DogList do

  ActiveAdmin.register DogList do
    permit_params :dog_id, :information, :photo_url, :pet_name, :breed, :created_at, :updated_at

    filter :dog_id_eq
    # other configurations...
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :dog_id, :pet_name, :breed, :information, :photo_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:dog_id, :pet_name, :breed, :information, :photo_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
