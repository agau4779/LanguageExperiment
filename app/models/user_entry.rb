class UserEntry < ActiveRecord::Base
  attr_accessible :created_at, :updated_at, :pairs
  belongs_to :iterative_chain
  serialize :pairs,Array
end
