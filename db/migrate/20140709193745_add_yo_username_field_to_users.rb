class AddYoUsernameFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :yo_username, :string
  end
end
