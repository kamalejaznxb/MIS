class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml

  def index
    @locations = Location.index_locations

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
      format.js
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        @locations = Location.index_locations
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        @locations = Location.index_locations
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end

#  To view Sub Locations in a Location.
  def show_sub_locations
    @locations = Location.sub_locations(params[:location_id])
    respond_to do |format|
      format.js
    end
  end

#  This method will assign a location to a User.
  def assign_location_to_user
    @users = User.users_not_assigned_to_any_location
    @empty_sub_locations = Location.where("id = #{params[:location_id]}").first.empty_sub_locations
    respond_to do |format|
      format.js
    end
  end

# This method will save a User in a Location.
  def save_location_assigned_user
    @user = User.where("id = #{params[:user_id]}").first
    @user.location_id = params[:location_id]
    if (@user.save)
      @locations = Location.index_locations
    end
    respond_to do |format|
      format.js
    end
  end

#  This method will show the users assigned to a Particular Location
  def show_users_at_location
    @users = Location.users_at_sub_locations(params[:location_id])
    respond_to do |format|
      format.js
    end
  end

  def get_location_back_from_user
    @user = User.where("id = #{params[:user_id]}").first
    @user.location_id = nil
    @user.save(:validate => false)
    respond_to do |format|
      format.js
    end
  end

  def move_user_to_another_sub_location
    if (!params[:user_id].nil?)
      @user = User.where("id = #{params[:user_id]}").first
      @locations = Location.index_locations
    elsif(!params[:location_id].nil?)
      @location = Location.where("id = #{params[:location_id]}").first
      @locations = @location.empty_sub_locations
      @location_type = Location.where("id = #{@locations.first[0]}").first.location_type.name
    end
    respond_to do |format|
      format.js
    end
  end

#  This method will filter the users based on the location_id.
  def location_users_filter
    @location = Location.where("id = #{params[:location_id]}").first
    @sub_locations = @location.locations
    full_tree_location_ids = @location.parent_location_full_child_tree
    logger.debug("**************** #{full_tree_location_ids}")

    @users = User.where("location_id IN (#{full_tree_location_ids})")
    
    respond_to do |format|
      format.js
    end
  end

end
