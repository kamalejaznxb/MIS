class ProcessorTypesController < ApplicationController
  # GET /processor_types
  # GET /processor_types.xml
  def index
    @processor_types = ProcessorType.order('created_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @processor_types }
    end
  end

  # GET /processor_types/1
  # GET /processor_types/1.xml
  def show
    @processor_type = ProcessorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @processor_type }
    end
  end

  # GET /processor_types/new
  # GET /processor_types/new.xml
  def new
    @processor_type = ProcessorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @processor_type }
    end
  end

  # GET /processor_types/1/edit
  def edit
    @processor_type = ProcessorType.find(params[:id])
  end

  # POST /processor_types
  # POST /processor_types.xml
  def create
    @processor_type = ProcessorType.new(params[:processor_type])

    respond_to do |format|
      if @processor_type.save
        format.html { redirect_to(@processor_type, :notice => 'Processor type was successfully created.') }
        format.xml  { render :xml => @processor_type, :status => :created, :location => @processor_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @processor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /processor_types/1
  # PUT /processor_types/1.xml
  def update
    @processor_type = ProcessorType.find(params[:id])

    respond_to do |format|
      if @processor_type.update_attributes(params[:processor_type])
        format.html { redirect_to(@processor_type, :notice => 'Processor type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @processor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /processor_types/1
  # DELETE /processor_types/1.xml
  def destroy
    @processor_type = ProcessorType.find(params[:id])
    @processor_type.destroy

    respond_to do |format|
      format.html { redirect_to(processor_types_url) }
      format.xml  { head :ok }
    end
  end
end
