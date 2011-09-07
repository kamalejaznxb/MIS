class ApplicationController < ActionController::Base
   protect_from_forgery
   helper_method :current_user
   before_filter :check_user
   include UserPermission
   def current_user
      @current_user ||= ((session[:user_id] && User.find_by_id(session[:user_id])) || 0)

   end
   def check_user
      unless params[:controller] == 'sessions'
         unless session.has_key?(:user_id)
            redirect_to login_path
         end
      end
   end

end
