class IterativeChain < ActiveRecord::Base
  has_many :user_entries, dependent: :destroy
end
