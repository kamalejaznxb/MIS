ActionMailer::Base.smtp_settings = {
  :address                => "mail.nxvt.com",
  :port                   => 25,
  :user_name              => "imran.latif@nxvt.com",
  :password               => "123456789",
  :authentication         => "plain",
  :enable_starttls_auto   => false
}