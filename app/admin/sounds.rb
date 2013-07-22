ActiveAdmin.register Sound do
  menu priority: 10
  show do |f|
    attributes_table do
      row :sound do
        audio_tag f.sound.url, controls: true
      end
    end
    active_admin_comments
  end
end
