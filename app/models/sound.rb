class Sound < ActiveRecord::Base
  attr_accessible :sound
  mount_uploader :sound, SoundUploader
end
