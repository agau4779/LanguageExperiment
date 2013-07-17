class Pair < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :sound, SoundUploader

  attr_accessible :image, :sound

  #validates_presence_of :image, :sound
end
