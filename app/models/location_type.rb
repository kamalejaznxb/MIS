class LocationType < ActiveRecord::Base

  has_many :locations

  validates :name, :presence => true, :uniqueness => true

end
