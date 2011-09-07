class ProfileController < ApplicationController
  include ChangePassword
  def index
  end
  def change_password
	respond_to do |format|
		if ChangePassword.change_pass current_user.username, params[:user][:old_password], params[:user][:new_password]

			format.html{ redirect_to( profile_index_path, 
				notice: "Password successfully changed") }
		else
			format.html{ redirect_to( profile_index_path,
				alert: "Password Verification failed") }
		end
	end
  end
end
