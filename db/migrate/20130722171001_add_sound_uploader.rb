class AddSoundUploader < ActiveRecord::Migration
  def change
    add_column :sounds, :sound, :string
    add_column :sounds, :filename, :string
  end
end
