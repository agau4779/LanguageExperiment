ActiveAdmin.register Pair do
  menu priority: 8

  show do |f|
    attributes_table do
      row :image do
        image_tag f.image
      end
      row :sound do
        audio_tag f.sound, controls: true
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Pair' do
      f.input :image_id
      f.input :sound_id
    end
    f.actions
  end
end
