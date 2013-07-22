class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :image
  validates_presence_of :image
end
