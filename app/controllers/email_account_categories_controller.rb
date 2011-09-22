class EmailAccountCategoriesController < ApplicationController
  # GET /email_account_categories
  # GET /email_account_categories.xml
  def index
    @email_account_categories = EmailAccountCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_account_categories }
    end
  end

  # GET /email_account_categories/1
  # GET /email_account_categories/1.xml
  def show
    @email_account_category = EmailAccountCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_account_category }
      format.js
    end
  end

  # GET /email_account_categories/new
  # GET /email_account_categories/new.xml
  def new
    @email_account_category = EmailAccountCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_account_category }
      format.js
    end
  end

  # GET /email_account_categories/1/edit
  def edit
    @email_account_category = EmailAccountCategory.find(params[:id])
    respond_to do |format|
      format.js {render :action => "new"}
    end
  end

  # POST /email_account_categories
  # POST /email_account_categories.xml
  def create
    @email_account_category = EmailAccountCategory.new(params[:email_account_category])

    respond_to do |format|
      if @email_account_category.save
        @email_account_categories = EmailAccountCategory.all
        format.html { redirect_to(@email_account_category, :notice => 'Email account category was successfully created.') }
        format.xml  { render :xml => @email_account_category, :status => :created, :location => @email_account_category }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_account_category.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /email_account_categories/1
  # PUT /email_account_categories/1.xml
  def update
    @email_account_category = EmailAccountCategory.find(params[:id])

    respond_to do |format|
      if @email_account_category.update_attributes(params[:email_account_category])
        @email_account_categories = EmailAccountCategory.all
        format.html { redirect_to(@email_account_category, :notice => 'Email account category was successfully updated.') }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_account_category.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /email_account_categories/1
  # DELETE /email_account_categories/1.xml
  def destroy
    @email_account_category = EmailAccountCategory.find(params[:id])
    @email_account_category.destroy

    respond_to do |format|
      format.html { redirect_to(email_account_categories_url) }
      format.xml  { head :ok }
    end
  end
end
