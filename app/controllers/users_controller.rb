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
          @proper_email_format = interpret_email_format(params[:email_format])
#          logger.debug("^^^^^^^^^^^^^^^^^^ #{email_format}")
#          UserMailer.new_user_hiring(@email_group, params[:email_format]).deliver
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

  def user_email_accounts
    @user = User.where("id = #{params[:user_id]}").first
    respond_to do |format|
      format.js
    end
  end

  def interpret_email_format(email_format)

    last_word = ""
    proper_email_format = ""
    email_format.split(" ").each do |w|
      if (last_word.include? "/*" and w.include? "@")
        w = check_for_nil_and_execute(w)
      end
      last_word = w
      proper_email_format = proper_email_format + " " + w
    end

    proper_email_format = proper_email_format.sub("/*", " ")
    proper_email_format = proper_email_format.sub("*/", " ")
    proper_email_format
    
#    actual_email_format = email_format
#
#    temp_email_format = actual_email_format.scan(/\w+/) {|w| puts w}
#
#    logger.debug("XXXXXXXXXXXXXXXX #{temp_email_format}")
#    email_format = "Imran Latif Pakistani"
#    email_format
  end

  private

  def check_for_nil_and_execute(word)

    executed_word = ""
    is_valid = true
    
    words = word.split(".")
    words_size = words.size

    if (!words.empty? && words_size > 1)
      current_object = words.first
      
      for i in 1..words_size-1 do
        logger.debug("^^^^^^^^^^^^ #{current_object}.class")
        if (eval(" !#{current_object}.respond_to?('#{words[i]}') || #{current_object}.#{words[i]}.nil?"))
          is_valid = false
          break
        end
        current_object = current_object + "." + words[i]
      end
      
    end

    if (is_valid)
      executed_word = eval(word)
    end

    executed_word
  end

end
