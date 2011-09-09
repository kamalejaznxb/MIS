class CategoryTypesController < ApplicationController
  # GET /category_types
  # GET /category_types.xml
  def index
    @category_types = CategoryType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @category_types }
    end
  end

  # GET /category_types/1
  # GET /category_types/1.xml
  def show
    @category_type = CategoryType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_type }
    end
  end

  # GET /category_types/new
  # GET /category_types/new.xml
  def new
    @category_type = CategoryType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category_type }
    end
  end

  # GET /category_types/1/edit
  def edit
    @category_type = CategoryType.find(params[:id])
  end

  # POST /category_types
  # POST /category_types.xml
  def create
    @category_type = CategoryType.new(params[:category_type])

    respond_to do |format|
      if @category_type.save
        format.html { redirect_to(@category_type, :notice => 'Category type was successfully created.') }
        format.xml  { render :xml => @category_type, :status => :created, :location => @category_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /category_types/1
  # PUT /category_types/1.xml
  def update
    @category_type = CategoryType.find(params[:id])

    respond_to do |format|
      if @category_type.update_attributes(params[:category_type])
        format.html { redirect_to(@category_type, :notice => 'Category type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_types/1
  # DELETE /category_types/1.xml
  def destroy
    @category_type = CategoryType.find(params[:id])
    @category_type.destroy

    respond_to do |format|
      format.html { redirect_to(category_types_url) }
      format.xml  { head :ok }
    end
  end
end
