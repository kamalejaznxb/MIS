class EmailGroup < ActiveRecord::Base

  validates   :name, :presence => true, :uniqueness => true
#  validates   :description, :presence => true
  
  has_and_belongs_to_many   :email_accounts

  has_many  :email_group_attachments
  accepts_nested_attributes_for :email_group_attachments, :allow_destroy => true

  def email_group_attachments_list
    self.email_group_attachments.map {|a| a.attachment_file_name}.join(", ")
  end

end
