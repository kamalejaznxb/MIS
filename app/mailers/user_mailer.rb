class UserMailer < ActionMailer::Base

  def new_user_hiring(email_group, email_format)
    @email_format = interpert_email_format(email_format)
    
    to_email_accounts = get_email_accounts_of_email_group(email_group.id, 'to')
    cc_email_accounts = get_email_accounts_of_email_group(email_group.id, 'cc')

    mail(:to => "#{to_email_accounts}", :cc => "#{cc_email_accounts}", :subject => email_group.email_subject , :from => "mis@nxb.com.pk")
  end

  def get_email_accounts_of_email_group(email_group_id, scope)
    ids = EmailAccountsEmailGroups.singular_email_account_ids(email_group_id, scope).map {|e| e}.join(", ")
    if ids && ids != ""
      email_accounts = EmailAccount.where("id IN (#{ids})").all.map { |e| e.email_address }.join(", ")
      email_accounts
    else
      ""
    end
  end

  def interpret_email_format(email_format)
    actual_email_format = email_format

    actual_email_format.scan(/\w+/) {|w| puts w}

    email_format
  end

end
