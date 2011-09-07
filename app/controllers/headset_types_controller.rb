class HeadsetTypesController < ApplicationController
  # GET /headset_types
  # GET /headset_types.xml
  def index
    @headset_types = HeadsetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @headset_types }
    end
  end

  # GET /headset_types/1
  # GET /headset_types/1.xml
  def show
    @headset_type = HeadsetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @headset_type }
    end
  end

  # GET /headset_types/new
  # GET /headset_types/new.xml
  def new
    @headset_type = HeadsetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @headset_type }
    end
  end

  # GET /headset_types/1/edit
  def edit
    @headset_type = HeadsetType.find(params[:id])
  end

  # POST /headset_types
  # POST /headset_types.xml
  def create
    @headset_type = HeadsetType.new(params[:headset_type])

    respond_to do |format|
      if @headset_type.save
        format.html { redirect_to(@headset_type, :notice => 'Headset type was successfully created.') }
        format.xml  { render :xml => @headset_type, :status => :created, :location => @headset_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @headset_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /headset_types/1
  # PUT /headset_types/1.xml
  def update
    @headset_type = HeadsetType.find(params[:id])

    respond_to do |format|
      if @headset_type.update_attributes(params[:headset_type])
        format.html { redirect_to(@headset_type, :notice => 'Headset type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @headset_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /headset_types/1
  # DELETE /headset_types/1.xml
  def destroy
    @headset_type = HeadsetType.find(params[:id])
    @headset_type.destroy

    respond_to do |format|
      format.html { redirect_to(headset_types_url) }
      format.xml  { head :ok }
    end
  end
end
