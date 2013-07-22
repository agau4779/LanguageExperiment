class Sound < ActiveRecord::Base
  attr_accessible :sound
  mount_uploader :sound, SoundUploader
  validates_presence_of :sound

  def sound_filename
    File.basename(sound.url, File.extname(sound.url))
  end
end
