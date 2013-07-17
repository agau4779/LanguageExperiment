class CreateUserEntries < ActiveRecord::Migration
  def change
    create_table :user_entries do |t|
      t.integer :iterative_chain_id
      t.timestamps
    end
  end
end
