class EmailGroupsController < ApplicationController
  # GET /email_groups
  # GET /email_groups.xml
  def index
    @email_groups = EmailGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_groups }
    end
  end

  # GET /email_groups/1
  # GET /email_groups/1.xml
  def show
    @email_group = EmailGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_group }
    end
  end

  # GET /email_groups/new
  # GET /email_groups/new.xml
  def new
    @email_group = EmailGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_group }
      format.js
    end
  end

  # GET /email_groups/1/edit
  def edit
    @email_group = EmailGroup.find(params[:id])
    respond_to do |format|
      format.js { render :action => "new" }
    end
  end

  # POST /email_groups
  # POST /email_groups.xml
  def create
    @email_group = EmailGroup.new(params[:email_group])

    respond_to do |format|
      if @email_group.save

        if (@email_group.email_accounts.size > 0)
          @email_group.email_accounts.clear
        end
        
        save_email_accounts_of_email_group(params[:email_accounts_to], @email_group.id, "to")
        save_email_accounts_of_email_group(params[:email_accounts_cc], @email_group.id, "cc")

#        @email_group.email_account_ids = params[:email_accounts]
        @email_groups = EmailGroup.all
        format.html { redirect_to(@email_group, :notice => 'Email group was successfully created.') }
        format.xml  { render :xml => @email_group, :status => :created, :location => @email_group }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_group.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /email_groups/1
  # PUT /email_groups/1.xml
  def update
    @email_group = EmailGroup.find(params[:id])

    respond_to do |format|
      if @email_group.update_attributes(params[:email_group])

        if (@email_group.email_accounts.size > 0)
          @email_group.email_accounts.clear
        end

        save_email_accounts_of_email_group(params[:email_accounts_to], @email_group.id, "to")
        save_email_accounts_of_email_group(params[:email_accounts_cc], @email_group.id, "cc")
        
#        @email_group.email_account_ids = params[:email_accounts]
        @email_groups = EmailGroup.all
        format.html { redirect_to(@email_group, :notice => 'Email group was successfully updated.') }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_group.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /email_groups/1
  # DELETE /email_groups/1.xml
  def destroy
    @email_group = EmailGroup.find(params[:id])
    @email_group.destroy

    respond_to do |format|
      format.html { redirect_to(email_groups_url) }
      format.xml  { head :ok }
    end
  end

  def save_email_accounts_of_email_group(email_accounts, email_group_id, scope)
    if email_accounts && !email_accounts.empty?
      email_accounts.each do |email_account|
        logger.debug("XXXXXXXXXXXXXXXXX #{scope}")
        EmailAccountsEmailGroups.create({:email_account_id => email_account, :email_group_id => email_group_id, :scope => scope })
      end
    end
  end

  def get_email_format
    @email_group = EmailGroup.where("id = #{params[:email_group]}").first
    respond_to do |format|
      format.js
    end
  end

end
