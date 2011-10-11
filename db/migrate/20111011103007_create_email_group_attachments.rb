class CreateEmailGroupAttachments < ActiveRecord::Migration
  def self.up
    create_table :email_group_attachments do |t|
      t.integer :email_group_id
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :email_group_attachments
  end
end
