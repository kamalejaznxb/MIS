class User < ActiveRecord::Base

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true

  has_many :tickets
  has_many :comments
  belongs_to :user_role
  include UserPermission
  #  has_many :assigned,
  #    :foreign_key => :assigned_id, :class_name=>'User'
  #  has_many :refered,
  #    :foreign_key => :refered_to, :class_name=>'User'
  scope :check_login, proc {|username|
    where( :username => username)}
  scope :check_user_login, proc { |username, password|
    where( :username => username, :password => password) }
  has_many :subordinates, class_name: "User",
    foreign_key:"dm_id"
  belongs_to :dm, class_name: "User"

  has_many :members, class_name: "User",
    foreign_key: "tl_id"
  belongs_to :tl, class_name: "User"

  scope :noc_staff, joins(:user_role) &  where('user_roles.title' => 'noc' )

  scope :mis_staff, joins(:user_role) &  where('user_roles.title' => 'MIS' )

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

  def encrypt_and_save_password
    
  end
  
end
