class IterativeChain < ActiveRecord::Base
  attr_accessible :lock_id, :locked_at
  has_many :user_entries, dependent: :destroy
  
end
