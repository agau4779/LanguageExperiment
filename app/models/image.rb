class Image < ActiveRecord::Base
  attr_accessible :image, :filename, :path
  mount_uploader :image, ImageUploader
  validates_presence_of :image

  before_save do
    self.filename = File.basename(self.image.url, File.extname(self.image.url))
    self.path = self.image.url
  end

  def self.find(f)
    if (f =~ /^[-+]?[0-9]+$/) || (f.is_a? Integer)
      super(f)
    else
      Image.where(filename: f.tr(' ', '_')).first
    end
  end
end
