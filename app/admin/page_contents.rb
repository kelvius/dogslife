ActiveAdmin.register PageContent do
  permit_params :title, :content, :page_type

  index do
    selectable_column
    id_column
    column :title
    column :page_type
    actions
  end

  filter :title
  filter :page_type

  form do |f|
    f.inputs do
      f.input :title
      f.input :page_type, as: :select, collection: ['about', 'contact']
      f.input :content, as: :text
    end
    f.actions
  end

end
