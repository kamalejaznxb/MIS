class CreateEmailAccountsEmailGroups < ActiveRecord::Migration
  def self.up
    create_table :email_accounts_email_groups, :id => false do |t|
      t.integer   :email_account_id
      t.integer   :email_group_id
      t.string    :scope

      t.timestamps
    end
  end

  def self.down
    drop_table :email_accounts_email_groups
  end
end
