class AddEmailToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :email, :string
  end
end
