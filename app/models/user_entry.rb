class UserEntry < ActiveRecord::Base
  attr_accessible :created_at, :updated_at
  belongs_to :iterative_chain
  has_many :pairs
end
