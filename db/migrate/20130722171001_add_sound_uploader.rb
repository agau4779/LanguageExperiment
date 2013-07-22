class AddSoundUploader < ActiveRecord::Migration
  def change
    add_column :sounds, :sound, :string
  end
end
