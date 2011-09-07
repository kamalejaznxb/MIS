class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }
end
