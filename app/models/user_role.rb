class UserRole < ActiveRecord::Base
  has_many :users
  def to_s
    self.title
  end
end
