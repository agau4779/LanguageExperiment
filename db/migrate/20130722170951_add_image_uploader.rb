class AddImageUploader < ActiveRecord::Migration
  def change
    add_column :images, :image, :string
    add_column :images, :filename, :string
  end
end
