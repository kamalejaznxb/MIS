class UsersController < ApplicationController
  def index
    #@users = User.order('created_at DESC').get_users
    @users = current_user.get_users
    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new
    1.times { @user.email_accounts.build }
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @user = User.new params[:user]
    respond_to do |format|
      if @user.save

        if params[:email_group] && params[:email_group] != ""
          @email_group = EmailGroup.where("id = #{params[:email_group]}").first
          UserMailer.new_user_hiring(@email_group).deliver
        end
        
        @users = current_user.get_users
        format.html { redirect_to( users_path,  :notice => 'Successfuly Sign In .' ) }
        format.js
      else
        format.html { redirect_to( users_path, :alert=>'Can not save User' ) }
        format.js
      end
    end
  end

  def edit
    @user = User.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update_attributes params[:user]
        if params[:email_group] && params[:email_group] != ""
          @email_group = EmailGroup.where("id = #{params[:email_group]}").first
          UserMailer.new_user_hiring(@email_group, params[:email_format]).deliver
        end
        format.js
      else
        format.js
      end
    end
  end

  def show
    @user = User.where("id = #{params[:id]}")
    respond_to do |format|
      format.js
    end
  end

  def profile
    @user = current_user
    respond_to do |format|
      format.html
    end
  end

end
