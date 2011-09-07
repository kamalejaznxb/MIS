class CreateKeyboardTypes < ActiveRecord::Migration
  def self.up
    create_table :keyboard_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :keyboard_types
  end
end
