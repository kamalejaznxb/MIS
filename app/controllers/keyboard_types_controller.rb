class KeyboardTypesController < ApplicationController
  # GET /keyboard_types
  # GET /keyboard_types.xml
  def index
    @keyboard_types = KeyboardType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @keyboard_types }
    end
  end

  # GET /keyboard_types/1
  # GET /keyboard_types/1.xml
  def show
    @keyboard_type = KeyboardType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @keyboard_type }
    end
  end

  # GET /keyboard_types/new
  # GET /keyboard_types/new.xml
  def new
    @keyboard_type = KeyboardType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @keyboard_type }
    end
  end

  # GET /keyboard_types/1/edit
  def edit
    @keyboard_type = KeyboardType.find(params[:id])
  end

  # POST /keyboard_types
  # POST /keyboard_types.xml
  def create
    @keyboard_type = KeyboardType.new(params[:keyboard_type])

    respond_to do |format|
      if @keyboard_type.save
        format.html { redirect_to(@keyboard_type, :notice => 'Keyboard type was successfully created.') }
        format.xml  { render :xml => @keyboard_type, :status => :created, :location => @keyboard_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @keyboard_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keyboard_types/1
  # PUT /keyboard_types/1.xml
  def update
    @keyboard_type = KeyboardType.find(params[:id])

    respond_to do |format|
      if @keyboard_type.update_attributes(params[:keyboard_type])
        format.html { redirect_to(@keyboard_type, :notice => 'Keyboard type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @keyboard_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keyboard_types/1
  # DELETE /keyboard_types/1.xml
  def destroy
    @keyboard_type = KeyboardType.find(params[:id])
    @keyboard_type.destroy

    respond_to do |format|
      format.html { redirect_to(keyboard_types_url) }
      format.xml  { head :ok }
    end
  end
end
