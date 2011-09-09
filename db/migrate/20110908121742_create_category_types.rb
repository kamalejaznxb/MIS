class CreateCategoryTypes < ActiveRecord::Migration
  def self.up
    create_table :category_types do |t|
      t.string :name
      t.text :description
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :category_types
  end
end
