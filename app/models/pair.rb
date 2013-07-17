class Pair < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :sound, SoundUploader

  attr_accessible :image, :sound
  has_and_belongs_to_many :user_entries

end
