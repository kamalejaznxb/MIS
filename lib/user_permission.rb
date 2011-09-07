module UserPermission

   def can_user_do? value
      roles = Hash.new
      roles[:TM] = %w{ edit }
      roles[:TL] = %w{ edit }
      roles[:DM] = %w{ edit }
      roles[:noc] =  %w{ MIS refer update_status }
      #roles[:MIS] = ["MIS", "refer", "update_status"]

      roles[:MIS] = %w{ MIS refer update_status #user_view add_user }

      #roles[:admin] = ["MIS", "refer", "update_status", "change_priority", "assign_to",
      #"user_view", "add_user"]
      roles[:admin] =  %w{ MIS refer update_status change_priority assign_to
      user_view add_user configuration}

      roles[:MIS_admin] = ["MIS", "refer", "update_status", "change_priority", "assign_to",
      "user_view"]

      roles[:noc_admin] = ["MIS", "refer", "update_status", "change_priority", "assign_to",
      "user_view"]
      roles[ self.user_role.title.to_sym ].each { |v|

         if v.eql? value.to_s then
         return true end }
         return false
      end
      #module_function :get_user_role
   end
