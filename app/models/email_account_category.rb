class EmailAccountCategory < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  has_many  :email_accounts

end
