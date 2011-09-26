class EmailAccount < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :email_account_category

  validates   :email_address, :presence => true, :uniqueness => true

end
