class TicketStatus < ActiveRecord::Base
  has_many :tickets
  scope :mis_status, where([' title <> ?', 'Solved'])

  def to_s
    self.title
  end
end
