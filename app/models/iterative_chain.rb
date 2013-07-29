class IterativeChain < ActiveRecord::Base
  attr_accessible :locked
  has_many :user_entries, dependent: :destroy

  scope :available, where(locked: false)
end
