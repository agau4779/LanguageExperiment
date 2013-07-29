class AddRememberTokenToIterativeChain < ActiveRecord::Migration
  def change
    add_column :iterative_chains, :remember_token, :string
    add_column :iterative_chains, :remember_token
  end
end
