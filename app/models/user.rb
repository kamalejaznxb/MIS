require 'digest'

class User < ActiveRecord::Base

  before_save :encrypt_password

  attr_accessor :password, :old_password, :new_password, :user_location_id

  validates :username, :presence => true, :uniqueness => true

  validates :password, :presence => true, :confirmation => true, :on => :create
  validates :password_confirmation, :presence => true, :unless => "password.blank?"
  
  validates :new_password, :presence => true, :confirmation => true, :on => :update, :unless => "old_password.blank?"
  validates :new_password_confirmation, :presence => true, :unless => "new_password.blank?"

  validate  :location_capacity_full, :on => :update
  validate  :old_password_correct, :on => :update
 
  has_many :tickets
  has_many :comments
  belongs_to :user_role

  belongs_to :location

  include UserPermission
  #  has_many :assigned,
  #    :foreign_key => :assigned_id, :class_name=>'User'
  #  has_many :refered,
  #    :foreign_key => :refered_to, :class_name=>'User'
  scope :check_login, proc {|username|
    where( :username => username)}
  
  scope :check_user_login, proc { |username, encrypted_password|
    where( :username => username, :encrypted_password => encrypted_password) }

  has_many :subordinates, class_name: "User",
    foreign_key:"dm_id"

  belongs_to :dm, class_name: "User"


  has_many :members, class_name: "User",
    foreign_key: "tl_id"

  belongs_to :tl, class_name: "User"

  scope :noc_staff, joins(:user_role) &  where('user_roles.title' => 'noc' )

  scope :mis_staff, joins(:user_role) &  where('user_roles.title' => 'MIS' )

  scope :users_not_assigned_to_any_location, where("location_id IS NULL OR location_id = ''")

  def to_s
    self.full_name
  end

  def get_users
    if self.user_role.title.eql? "admin"
      User.order('created_at DESC').all
    elsif ( self.user_role.title == "MIS_admin" || self.user_role.title== "MIS" )
      User.search({ user_role_title_ne: 'admin' }).order('created_at DESC')
    elsif self.user_role.title.eql? "noc_admin"
      User.search({'user_role_title_like' => 'noc'}).order('created_at DESC')
    end
  end

  def get_assign_staff
    if self.user_role.title.eql? "admin"
      User.search({ 'user_role_title_ne' => 'Employee', :user_role_title_ne => 'DM'}).
        order('created_at DESC')
    elsif self.user_role.title.eql? "MIS_admin"
      User.search({ 'user_role_title_like' => 'MIS'})
    elsif self.user_role.title.eql? "noc_admin"
      User.search({ 'user_role_title_like' => 'noc'})
    end
  end

  def get_refer_staff
    if self.user_role.title.eql? "admin"
      User.search({ 'user_role_title_ne' => 'Employee', :user_role_title_ne => 'DM'}).
        order('created_at DESC')
    elsif ( self.user_role.title== "MIS_admin"|| self.user_role.title=="MIS" )
      User.search({ 'user_role_title_like' => 'noc_admin'})
    elsif ( self.user_role.title== "noc_admin" || self.user_role.title=="noc")
      User.search({ 'user_role_title_like' => 'MIS_admin'})
    end

  end

  def get_user_roles
    if self.user_role.title.eql? "admin"
      UserRole.order('created_at DESC').all
    elsif ( self.user_role.title == "MIS_admin" || self.user_role.title == "MIS" )
      UserRole.search({ title_ne: "admin" }).order('created_at ASC')
    elsif self.user_role.title.eql? "MIS_noc"
      UserRole.search({ title_like: "noc" })
    end
  end

  def self.get_tl
    User.search({ user_role_title_eq: "TL" }).all
  end

  def self.get_dm
    User.search({ user_role_title_eq: "DM" }).all
  end

  def tl_list
    self.tl_id unless self.tl_id.nil?
  end

  def tl_list=( value )
    logger.debug("XXXXXXXXXXXXXXX #{value}")
    self.tl_id = value
    self.dm ||=  User.find_by_id( value ).dm
  end

  def check_employee value
    unless self.user_role.nil?
      if self.user_role.title == 'TL' && value == "DM"
        ""
      elsif self.user_role.title == 'TM' && value == "TL"
        ""
      else
        "hide"
      end
    else
      "hide"
    end
  end

  def get_tickets
    if self.user_role.title.eql? 'TL'
      Ticket.search({ user_tl_id_or_user_id_eq: self.id }).order('created_at DESC').all
    elsif self.user_role.title.eql? 'DM'
      Ticket.search({ user_dm_id_or_user_id_eq: self.id }).order('created_at DESC').all
    else
      self.tickets.order('created_at DESC')
    end
  end

  def get_ticket id
    if self.user_role.title.eql? 'TL'
      if Ticket.search({ user_tl_id_eq: self.id, id_eq: id }).first.nil?
        self.tickets.find_by_id id
      else
        Ticket.search({ user_tl_id_eq: self.id, id_eq: id }).first
      end
    elsif self.user_role.title.eql? 'DM'
      if Ticket.search({ user_dm_id_eq: self.id, id_eq: id }).first.nil?
        self.tickets.find_by_id id
      else
        Ticket.search({ user_dm_id_eq: self.id, id_eq: id }).first
      end
    else
      self.tickets.find_by_id id
    end
  end

  def encrypt_password
    return if password.nil? || password.blank?
    self.encrypted_password = self.class.get_encrypted_password(password)
  end

  def self.get_encrypted_password(password)
    Digest::SHA2.hexdigest(password)
  end

#  This method will check if the location that is being assigned to user is full or not. If it is already full then we will not assign a User to it.
  def location_capacity_full
    if (!self.user_location_id.blank?)
      self.location_id = self.user_location_id
      if (self.location_id.to_i != 0 && !self.location_id.nil? && self.location.users.count >= self.location.capacity.to_i)
        errors.add(:location_id, "is already full or no capacity.")
      end
    end
  end

#  This method will check that the old password matches with the existing Password while updating the User.
  def old_password_correct
    if (!self.old_password.blank? && self.class.get_encrypted_password(self.old_password) != self.encrypted_password)
      errors.add(:old_password, "doesn't match with the Existing Password.")
    elsif(self.old_password.blank? && !self.new_password.blank?)
      errors.add(:old_password, "cannot be blank")
    else
      self.password = self.new_password
    end
  end
  
end
