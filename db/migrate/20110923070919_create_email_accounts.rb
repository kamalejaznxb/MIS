class CreateEmailAccounts < ActiveRecord::Migration
  def self.up
    create_table :email_accounts do |t|
      t.integer   :user_id
      t.integer   :email_account_category_id
      t.string    :email_address
      t.boolean   :status, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :email_accounts
  end
end
