class EmailGroup < ActiveRecord::Base

  validates   :name, :presence => true, :uniqueness => true
  validates   :description, :presence => true

  has_and_belongs_to_many   :email_accounts

end
