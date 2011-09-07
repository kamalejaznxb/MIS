class MonitorTypesController < ApplicationController
  # GET /monitor_types
  # GET /monitor_types.xml
  def index
    @monitor_types = MonitorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @monitor_types }
    end
  end

  # GET /monitor_types/1
  # GET /monitor_types/1.xml
  def show
    @monitor_type = MonitorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @monitor_type }
    end
  end

  # GET /monitor_types/new
  # GET /monitor_types/new.xml
  def new
    @monitor_type = MonitorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @monitor_type }
    end
  end

  # GET /monitor_types/1/edit
  def edit
    @monitor_type = MonitorType.find(params[:id])
  end

  # POST /monitor_types
  # POST /monitor_types.xml
  def create
    @monitor_type = MonitorType.new(params[:monitor_type])

    respond_to do |format|
      if @monitor_type.save
        format.html { redirect_to(@monitor_type, :notice => 'Monitor type was successfully created.') }
        format.xml  { render :xml => @monitor_type, :status => :created, :location => @monitor_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @monitor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /monitor_types/1
  # PUT /monitor_types/1.xml
  def update
    @monitor_type = MonitorType.find(params[:id])

    respond_to do |format|
      if @monitor_type.update_attributes(params[:monitor_type])
        format.html { redirect_to(@monitor_type, :notice => 'Monitor type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @monitor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /monitor_types/1
  # DELETE /monitor_types/1.xml
  def destroy
    @monitor_type = MonitorType.find(params[:id])
    @monitor_type.destroy

    respond_to do |format|
      format.html { redirect_to(monitor_types_url) }
      format.xml  { head :ok }
    end
  end
end
