class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user
      t.text :description
      t.datetime :deadline

      t.timestamps
    end
  end
end
