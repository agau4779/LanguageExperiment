class Sound < ActiveRecord::Base
  attr_accessible :sound, :filename
  mount_uploader :sound, SoundUploader
  validates_presence_of :sound

  before_save do
    self.filename = File.basename(self.sound.url, File.extname(self.sound.url))
  end

  def self.find(f)
    if f.is_a? String
      Sound.where(filename: f).first
    else
      super(f)
    end
  end
end
