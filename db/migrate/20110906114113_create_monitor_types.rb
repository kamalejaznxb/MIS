class CreateMonitorTypes < ActiveRecord::Migration
  def self.up
    create_table :monitor_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :monitor_types
  end
end
