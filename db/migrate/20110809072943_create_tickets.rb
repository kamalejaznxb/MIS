class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.text :description
      t.references :ticket_category
      t.references :user
      t.references :ticket_status, :default=>1
      t.references :ticket_type, :default=>1
      t.references :ticket_priority, :default=>1
      t.integer :assigned_to
      t.integer :refered_to
      t.string :attachment_file_name
      t.string :subject
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.string :ip
      t.datetime :attachment_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
