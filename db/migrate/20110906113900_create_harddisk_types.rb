class CreateHarddiskTypes < ActiveRecord::Migration
  def self.up
    create_table :harddisk_types do |t|
      t.string :name
      t.string :size
      t.text :description
      t.references :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :harddisk_types
  end
end
