class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :display_file_name
      t.string :display_content_type
      t.integer :display_file_size
      t.datetime :display_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
