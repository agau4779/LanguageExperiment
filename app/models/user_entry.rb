class UserEntry < ActiveRecord::Base
  attr_accessible :created_at, :updated_at, :pairs
  belongs_to :iterative_chain
  has_and_belongs_to_many :pairs

end
