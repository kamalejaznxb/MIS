class CreateMouseTypes < ActiveRecord::Migration
  def self.up
    create_table :mouse_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :mouse_types
  end
end
