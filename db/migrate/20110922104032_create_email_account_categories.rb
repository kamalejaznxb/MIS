class CreateEmailAccountCategories < ActiveRecord::Migration
  def self.up
    create_table :email_account_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :email_account_categories
  end
end
