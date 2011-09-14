class Location < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => {:scope => :location_id}

  validates :location_type, :presence => true
  validate  :location_capacity_overflow, :on => :update

  belongs_to    :location_type

  has_many      :locations
  belongs_to    :location

  has_many  :users

  scope :index_locations,   where("location_id IS NULL")    # For Locations to be displayed at Index Page.
  scope :parent_locations,  lambda{|id=nil| where("id != #{id}") unless id.nil?}   # For the Drop Down to select a Parent Location.
  scope :sub_locations, lambda{|location_id| where("location_id = #{location_id}")}

#  Parent Location of the created Location.
  def parent_location
    return "" if self.location_id.nil? || self.location_id.blank?
    self.location.name
  end

#  This method will check a location's capacity while updating a location. If it has more users and we are reducing it's capacity then should not happen at all.
  def location_capacity_overflow
    if (!self.capacity.nil? && self.capacity.to_i < self.users.count)
      errors.add(:capacity, "cannot be changed because it has more users. Please! delete some users and try again.")
    end
    
  end

end
