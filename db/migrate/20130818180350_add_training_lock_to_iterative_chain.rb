class AddTrainingLockToIterativeChain < ActiveRecord::Migration
  def change
    add_column :iterative_chains, :training_lock, :string
  end
end
