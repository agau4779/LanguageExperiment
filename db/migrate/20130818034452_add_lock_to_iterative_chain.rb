class AddLockToIterativeChain < ActiveRecord::Migration
  def change
    add_column :iterative_chains, :lock_id, :string
    add_column :iterative_chains, :locked_at, :datetime
    remove_column :iterative_chains, :locked, :boolean
  end
end
