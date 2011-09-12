class Location < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  belongs_to :location_type

  scope :index_locations, where("location_id IS NULL")
  scope :parent_locations, lambda{|id=nil| where("id != #{id}") unless id.nil?}

end
