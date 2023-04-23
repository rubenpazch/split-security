class AddUserToPerson < ActiveRecord::Migration[7.0]
  def change
    add_reference :people, :user, index: true
    add_foreign_key :people, :users
  end
end
