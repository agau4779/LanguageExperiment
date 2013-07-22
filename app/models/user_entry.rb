class UserEntry < ActiveRecord::Base
  attr_accessible :created_at, :updated_at, :pairs
  belongs_to :iterative_chain
  serialize :pairs,Array

  def json
    result = Array.new
    pairs.each do |i|
      pair = Pair.find_by_id(i)
      result << { image: pair.image, sound: pair.sound}
    end
    result
  end
end
