class Pair < ActiveRecord::Base
  attr_accessible :image_id, :sound_id
  validates_presence_of :image_id, :sound_id

  def image
    Image.find_by_id(image_id).image.url
  end

  def sound
    Sound.find_by_id(sound_id).sound.url
  end

  def image_filename
    Image.find_by_id(image_id).image_filename
  end
  
  def sound_filename
    Sound.find_by_id(sound_id).sound_filename
  end
end
