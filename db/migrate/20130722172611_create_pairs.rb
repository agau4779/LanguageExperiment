class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :image_id
      t.integer :sound_id
      t.timestamps
    end
  end
end
