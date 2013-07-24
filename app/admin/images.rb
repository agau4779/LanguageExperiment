ActiveAdmin.register Image do
  menu priority: 9

  index do
    column :id
    column "Image", :filename
    default_actions
  end

  show do |f|
    attributes_table do
      row :filename do
        f.filename
      end
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
