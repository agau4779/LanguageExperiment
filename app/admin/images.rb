ActiveAdmin.register Image do
  menu priority: 9
  
  show do |f|
    attributes_table do
      row :image do
        image_tag(f.image.url)
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Image' do
      f.input :image, hint: (url = f.object.image.try(:url)) ? f.template.image_tag(url) : ''
    end
    f.actions
  end
end
