class EmailAccountsEmailGroups < ActiveRecord::Base

  def self.singular_email_account_ids(email_group_id, scope)
    where("email_group_id = #{email_group_id} AND scope = '#{scope}'").select("email_account_id").map{|e| e.email_account_id.to_i}.to_a
  end

end
