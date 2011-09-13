class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string      :username
      t.string      :password
      t.string      :full_name
      t.string      :dm_id
      t.string      :tm
      t.string      :tl_id
      t.integer     :location_id
      t.references  :user_role
     

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
