class AddAuthorToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :author_id, :string, presence: true
    add_index :comments, :author_id
  end
end
