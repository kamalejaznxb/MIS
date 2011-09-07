module ChangePassword
	def change_pass user_name, password, new_password
		ldap = Net::LDAP.new
		ldap.host = "10.28.82.2"
		ldap.port = 389
		ldap.auth "nextbridge\\#{ user_name }", password
		if ldap.bind
      #			change = %w{ :replace :password new_password }
      change = [
        [:replace, :password, new_password]
      ]
      full_name=  get_user(user_name, password)
      dn = "cn=#{full_name}, DC=NEXTBRIDGE, DC=ORG"
      puts dn
      if ldap.modify( dn: dn, operations: change )
				puts "*****************#{change}"
			else
				puts "*****************#{change} false"
			end
		else
			false
		end
			
	end

  def get_user(user, password)
    ldap = Net::LDAP.new :host => '10.28.82.2',  :port => 389,
      :auth => {:method => :simple, :username => user + '@nextbridge', :password => password }
    filter = Net::LDAP::Filter.eq( "sAMAccountName", user )
    treebase = "OU=vteams, DC=NEXTBRIDGE, DC=ORG"
    ldap.search( :base => treebase, :filter => filter ) do |entry|
      return entry.cn
    end
  end
	module_function :change_pass, :get_user
end
