class CreateHeadsetTypes < ActiveRecord::Migration
  def self.up
    create_table :headset_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :headset_types
  end
end
