class RemoveNotNullConstraintFromEmailAndAgeInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :email, true
    change_column_null :users, :age, true
  end
end
