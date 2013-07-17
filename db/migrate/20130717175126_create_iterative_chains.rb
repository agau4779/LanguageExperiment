class CreateIterativeChains < ActiveRecord::Migration
  def change
    create_table :iterative_chains do |t|
      t.boolean :locked
      t.timestamps
    end
  end
end
