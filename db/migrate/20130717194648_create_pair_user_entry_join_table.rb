class CreatePairUserEntryJoinTable < ActiveRecord::Migration
  def change
    create_table :pairs_user_entries do |t|
      t.references :user_entry
      t.references :pair
    end
  end
end
