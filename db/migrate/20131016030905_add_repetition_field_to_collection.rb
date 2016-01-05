class AddRepetitionFieldToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :repetition, :string
  end
end
