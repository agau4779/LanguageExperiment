class Sound < ActiveRecord::Base
  attr_accessible :sound, :filename, :path
  mount_uploader :sound, SoundUploader
  validates_presence_of :sound

  before_save do
    self.filename = File.basename(self.sound.url, File.extname(self.sound.url))
    self.path = self.sound.url
  end

  def self.find(f)
    if !!(f =~ /^[-+]?[0-9]+$/)
      super(f)
    else
      Sound.where(filename: f).first
    end
  end
end
