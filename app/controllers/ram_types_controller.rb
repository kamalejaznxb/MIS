class RamTypesController < ApplicationController
  # GET /ram_types
  # GET /ram_types.xml
  def index
    @ram_types = RamType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ram_types }
    end
  end

  # GET /ram_types/1
  # GET /ram_types/1.xml
  def show
    @ram_type = RamType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ram_type }
    end
  end

  # GET /ram_types/new
  # GET /ram_types/new.xml
  def new
    @ram_type = RamType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ram_type }
    end
  end

  # GET /ram_types/1/edit
  def edit
    @ram_type = RamType.find(params[:id])
  end

  # POST /ram_types
  # POST /ram_types.xml
  def create
    @ram_type = RamType.new(params[:ram_type])

    respond_to do |format|
      if @ram_type.save
        format.html { redirect_to(@ram_type, :notice => 'Ram type was successfully created.') }
        format.xml  { render :xml => @ram_type, :status => :created, :location => @ram_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ram_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ram_types/1
  # PUT /ram_types/1.xml
  def update
    @ram_type = RamType.find(params[:id])

    respond_to do |format|
      if @ram_type.update_attributes(params[:ram_type])
        format.html { redirect_to(@ram_type, :notice => 'Ram type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ram_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ram_types/1
  # DELETE /ram_types/1.xml
  def destroy
    @ram_type = RamType.find(params[:id])
    @ram_type.destroy

    respond_to do |format|
      format.html { redirect_to(ram_types_url) }
      format.xml  { head :ok }
    end
  end
end
