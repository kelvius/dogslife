ActiveAdmin.register Dog do
  filter :dog_list_id  # only if dog_list_id directly relates to a searchable field or association

  permit_params :name, :breed, :story, :photo_url, :price, :available_for_adoption, :dog_type

  form do |f|
    f.semantic_errors
    f.inputs 'Dog Details' do
      f.input :name
      f.input :breed
      f.input :story
      f.input :photo_url
      f.input :available_for_adoption, as: :boolean
      f.input :dog_type, as: :select, collection: Dog::DOG_TYPES, include_blank: false
    end
    f.actions
  end
end
