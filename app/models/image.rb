class Image < ActiveRecord::Base
  attr_accessible :image, :filename
  mount_uploader :image, ImageUploader
  validates_presence_of :image

  before_save do
    self.filename = File.basename(self.image.url, File.extname(self.image.url))
  end

  def self.find(f)
    if f.is_a? String
      Image.where(filename: f).first
    else
      super(f)
    end
  end
end
