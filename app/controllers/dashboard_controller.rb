class DashboardController < ApplicationController
  include DashboardHelper
  def index
    
    @users = User.mis_staff
    respond_to do |format|
      format.html
      if params.has_key?(:type)
        if params[:type].eql? 'Chart'
          @value = get_data_json( DateCounter::count_date( params[:value] ))
          format.json{ render :json => @value }
        else
          format.js{ render 'user_list'}
        end
      end
    end
  end
  def show
  end

  def new
  end

end
