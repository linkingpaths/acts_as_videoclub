class ActsAsVideoclubMigration < ActiveRecord::Migration

  def self.up
    create_table :videos do |t|
      t.string  :source_url
      t.string  :title
      t.string  :description
      t.integer :resource_id
      t.string  :resource_type
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end

end