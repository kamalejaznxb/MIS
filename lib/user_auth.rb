module UserAuth
   def check_user user_name, password
      ldap = Net::LDAP.new
      ldap.host = "10.28.82.2"
      ldap.port = 389
      ldap.auth "nextbridge\\#{user_name}", "#{password}"

      if ldap.bind # will return false if authentication is NOT successful



         user = User.check_login user_name
         if user.empty?
            user = User.new
            user.full_name = ldap.search(base:"DC=nextbridge,DC=org",filter: Net::LDAP::Filter.eq("sAMAccountName", user_name), attributes: %w[displayName], return_result:true).first.displayName.first
            user.username = user_name
            user.user_role = UserRole.find_by_title( 'TM' )
            user.save
            true
         else
            true
         end
      elsif User.check_admin( user_name, password ).empty?
         false
      else
         true
      end
   end
   module_function :check_user
end
