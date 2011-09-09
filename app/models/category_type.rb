class CategoryType < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true
  def to_s
      self.name
  end
end
