class NetworkManagement < ActiveRecord::Base
   # before_save :add_addresses
   def ip_range; end
   def ip_range=( value ); end
   #  def add_addresses

   #    self.broadcast_address = IPAddress( self.ip ).broadcast
   #    self.netmask = IPAddress( self.ip ).netmask
   #    self.network_address = IPAddress( self.ip ).network
   #  end
   def broadcast_address
      IPAddress( self.ip ).broadcast
   end
   def network_address
      IPAddress( self.ip ).network
   end
   def netmask_address
      IPAddress( self.ip ).netmask
   end
   def to_s
      self.ip
   end

end
