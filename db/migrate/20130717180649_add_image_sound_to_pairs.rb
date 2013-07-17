class AddImageSoundToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :image, :string
    add_column :pairs, :sound, :string
  end
end
