class CreateNetworkManagements < ActiveRecord::Migration
  def self.up
    create_table :network_managements do |t|
      t.string :ip
      t.string :hall
      t.string :center
      t.string :city
      t.timestamps
    end
  end

  def self.down
    drop_table :network_managements
  end
end
