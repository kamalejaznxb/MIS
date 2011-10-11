class EmailGroupAttachment < ActiveRecord::Base

  belongs_to  :email_group

  has_attached_file   :attachment, :style => {},
    :url => "/email_group_attachments/:basename_:id.:extension",
    :path => "#{Rails.root}/public/email_group_attachments/:basename_:id.:extension"

end
