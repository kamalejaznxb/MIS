class Location < ActiveRecord::Base

  @@full_tree_location_ids = ""

  def self.full_tree_location_ids
    @@full_tree_location_ids
  end

  def self.full_tree_location_ids=(value)
    @@full_tree_location_ids = value
  end

  validates :name, :presence => true, :uniqueness => {:scope => :location_id}

  validates :location_type, :presence => true
  validate  :location_capacity_overflow, :on => :update
  validate  :empty_space_for_sub_location, :on => :create

  belongs_to    :location_type

  has_many      :locations
  belongs_to    :location

  has_many  :users

  scope :index_locations,         where("location_id IS NULL")    # For Locations to be displayed at Index Page.
  scope :parent_locations,        lambda {|id=nil| where("id != #{id}") unless id.nil? }    # For the Drop Down to select a Parent Location.
  scope :sub_locations,           lambda {|location_id| where("location_id = #{location_id}") }   # For fetching sub-locations of a Parent Location.
  scope :users_at_sub_locations,  lambda {|location_id| select("locations.location_id, locations.name as location_name, users.id as user_id, users.full_name as user_name").joins("INNER JOIN users on users.location_id = locations.id").where("users.location_id IN (Select id from locations where location_id = #{location_id})").order("locations.id ASC")}
  
#  Parent Location of the created Location.
  def parent_location
    return "" if self.location_id.nil? || self.location_id.blank?
    self.location.name
  end

#  This method will check a location's capacity while updating a location. If it has more sub-locations and we are reducing it's capacity then should not happen at all.
  def location_capacity_overflow
    logger.debug("XXXXXXXXXXXXXXXXX Imran Latif - Index Location")
    if (self.capacity.to_i != 0 && !self.capacity.nil? && self.capacity.to_i < self.locations.count)
      errors.add(:location, "cannot be created / updated. Have more sub-locations than capacity you are specifying right now. Please! delete and try again.")
    end
    
  end

#   This method will check Parent Location's Capacity to accomodate the new New Sub Location.
  def empty_space_for_sub_location
    if (!self.location_id.nil?)
      logger.debug("XXXXXXXXXXXXXXXXX Imran Latif - Parent Location")
      parent_location = self.location
      if (parent_location.capacity.to_i != 0 && !parent_location.capacity.nil? && parent_location.locations.count >= parent_location.capacity.to_i)
        errors.add(:location, "cannot be created / updated. Already full. Please! delete and try again.")
      end
    end
  end

  def empty_sub_locations
    empty_locations = []
    self.locations.each do |sub_location|
      if sub_location.users.count == 0
        empty_locations << [sub_location.id, sub_location.name]
      end
    end
    empty_locations
  end

#  This method will tell the full hierarchy of a location.
  def full_hierarchy
    hierarchy = []
    current_location = self
    hierarchy << current_location.name
    while(1)
      if (current_location.location)
        location = current_location.location
        hierarchy << location.name
        current_location = location
      else
        break
      end
    end
    hierarchy.reverse.map {|h| h}.join(", ")
  end

#  This method will give us the all sub_locations of a Parent Location. If a sub_location has other sub_locations then they will be presented too. It's implementation is Recursive.
  def parent_location_full_child_tree
    parent_location = self

    self.class.full_tree_location_ids = self.class.full_tree_location_ids + "#{self.id}, "
    
    parent_location.locations.each do |location|

      self.class.full_tree_location_ids = self.class.full_tree_location_ids + "#{location.id}, "
      logger.debug("XXXXXXXXXXXXXx #{self.class.full_tree_location_ids}")
      
      unless location.locations.empty?
        location.parent_location_full_child_tree
      end
    end
    self.class.full_tree_location_ids[0..-3]
  end

end
