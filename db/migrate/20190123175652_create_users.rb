class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    # create_table(:table_name, prc) # THIS SHOULD BE A COMMENT
    create_table :users do |t|
      # t.type(:column_name, options_hash) # THIS SHOULD BE A COMMENT
      t.string :username, null: false
      t.timestamps
    end

    # For unique constraint, must add an index
    # add_index(:table_name, :column_name, options_hash) # THIS SHOULD BE A COMMENT
    add_index :users, :username, unique: true
  end
end
