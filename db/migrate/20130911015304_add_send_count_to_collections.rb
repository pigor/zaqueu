class AddSendCountToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :send_count, :integer, default: 0
  end
end
