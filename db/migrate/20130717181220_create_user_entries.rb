class CreateUserEntries < ActiveRecord::Migration
  def change
    create_table :user_entries do |t|
      t.integer :iterative_chain_id
      t.text :pairs
      t.timestamps
    end
  end
end
