class TicketCategory < ActiveRecord::Base
  has_many :tickets
  has_many :sub_category, :class_name => "TicketCategory",
    :foreign_key => "ticket_category_id"
  belongs_to :category, :class_name => "TicketCategory"

  scope :technical_issue, where([' title =? ', "Technical"] )
  scope :internet_issue, where(['title =? ', "Internet" ])
  scope :software_issue, where(['title =?', "Software" ])
  scope :hardware_issue, where(['title =?', "New hardware Request"])
  def to_s
    self.title
  end
end
