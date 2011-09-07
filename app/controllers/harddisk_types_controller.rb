class HarddiskTypesController < ApplicationController
  # GET /harddisk_types
  # GET /harddisk_types.xml
  def index
    @harddisk_types = HarddiskType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @harddisk_types }
    end
  end

  # GET /harddisk_types/1
  # GET /harddisk_types/1.xml
  def show
    @harddisk_type = HarddiskType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @harddisk_type }
    end
  end

  # GET /harddisk_types/new
  # GET /harddisk_types/new.xml
  def new
    @harddisk_type = HarddiskType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @harddisk_type }
    end
  end

  # GET /harddisk_types/1/edit
  def edit
    @harddisk_type = HarddiskType.find(params[:id])
  end

  # POST /harddisk_types
  # POST /harddisk_types.xml
  def create
    @harddisk_type = HarddiskType.new(params[:harddisk_type])

    respond_to do |format|
      if @harddisk_type.save
        format.html { redirect_to(@harddisk_type, :notice => 'Harddisk type was successfully created.') }
        format.xml  { render :xml => @harddisk_type, :status => :created, :location => @harddisk_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @harddisk_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /harddisk_types/1
  # PUT /harddisk_types/1.xml
  def update
    @harddisk_type = HarddiskType.find(params[:id])

    respond_to do |format|
      if @harddisk_type.update_attributes(params[:harddisk_type])
        format.html { redirect_to(@harddisk_type, :notice => 'Harddisk type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @harddisk_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /harddisk_types/1
  # DELETE /harddisk_types/1.xml
  def destroy
    @harddisk_type = HarddiskType.find(params[:id])
    @harddisk_type.destroy

    respond_to do |format|
      format.html { redirect_to(harddisk_types_url) }
      format.xml  { head :ok }
    end
  end
end
