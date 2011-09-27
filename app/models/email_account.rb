class EmailAccount < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :email_account_category

  validates   :email_address, :uniqueness => true

  has_and_belongs_to_many   :email_groups

end
