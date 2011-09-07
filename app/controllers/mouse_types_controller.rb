class MouseTypesController < ApplicationController
  # GET /mouse_types
  # GET /mouse_types.xml
  def index
    @mouse_types = MouseType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mouse_types }
    end
  end

  # GET /mouse_types/1
  # GET /mouse_types/1.xml
  def show
    @mouse_type = MouseType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mouse_type }
    end
  end

  # GET /mouse_types/new
  # GET /mouse_types/new.xml
  def new
    @mouse_type = MouseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mouse_type }
    end
  end

  # GET /mouse_types/1/edit
  def edit
    @mouse_type = MouseType.find(params[:id])
  end

  # POST /mouse_types
  # POST /mouse_types.xml
  def create
    @mouse_type = MouseType.new(params[:mouse_type])

    respond_to do |format|
      if @mouse_type.save
        format.html { redirect_to(@mouse_type, :notice => 'Mouse type was successfully created.') }
        format.xml  { render :xml => @mouse_type, :status => :created, :location => @mouse_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mouse_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mouse_types/1
  # PUT /mouse_types/1.xml
  def update
    @mouse_type = MouseType.find(params[:id])

    respond_to do |format|
      if @mouse_type.update_attributes(params[:mouse_type])
        format.html { redirect_to(@mouse_type, :notice => 'Mouse type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mouse_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mouse_types/1
  # DELETE /mouse_types/1.xml
  def destroy
    @mouse_type = MouseType.find(params[:id])
    @mouse_type.destroy

    respond_to do |format|
      format.html { redirect_to(mouse_types_url) }
      format.xml  { head :ok }
    end
  end
end
