class EmailAccount < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :email_account_category

end
