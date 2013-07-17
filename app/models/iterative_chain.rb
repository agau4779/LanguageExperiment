class IterativeChain < ActiveRecord::Base
  attr_accessible :locked
  belongs_to :iterative_chain
  has_many :user_entries, dependent: :destroy
end
