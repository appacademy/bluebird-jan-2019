class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :chirp_id, null: false
      t.timestamps
    end

    # we don't want liz to like the same chirp more than once
    add_index :likes, [:user_id, :chirp_id], unique: true
    add_index :likes, :chirp_id
  end
end
