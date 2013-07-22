class Pair < ActiveRecord::Base
  attr_accessible :image_id, :sound_id
  def image
    Image.find_by_id(image_id).image.url
  end
  def sound
    Sound.find_by_id(sound_id).sound.url
  end
end
