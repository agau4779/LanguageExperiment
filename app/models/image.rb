class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :image
  validates_presence_of :image

  def image_filename
    File.basename(image.url, File.extname(image.url))
  end
end
