class CreateRamTypes < ActiveRecord::Migration
  def self.up
    create_table :ram_types do |t|
      t.string :name
      t.string :size
      t.references :capacity
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :ram_types
  end
end
