class RemoveNotNullConstraintFromEmailAndAgeInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :string
    change_column :users, :age, :integer
  end
end
