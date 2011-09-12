class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string  :name
      t.integer :location_type_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
