class SessionsController < ApplicationController
  layout 'login'
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end


  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    #user = User.check_login params[:user][:login], params[:user][:password]
    user = UserAuth.check_user params[:user][:login], params[:user][:password]
    respond_to do |format|
      #unless user.empty?
      logger.debug("XXXXXXXXXXX #{user}")
      if user
        #session[:user] = user.first.full_name
        #session[:role] = user.first.user_role.to_s
        #session[:user_id] = user.first.id
        session[:user_id] = User.check_login( params[:user][:login] ).first.id
        format.html { redirect_to( "/",  :notice => 'Successfuly Sign In .' ) }
      else
        format.html { redirect_to( login_path, :alert => 'Invalid Username or password' ) }
      end
      format.js
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      format.html{ redirect_to( login_path, :notice=>'Logout successfull' ) }
    end

  end
  
end
