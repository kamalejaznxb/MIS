class TicketType < ActiveRecord::Base
  has_many :tickets
  def to_s
    self.title
  end
end
