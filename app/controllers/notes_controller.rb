class NotesController < ApplicationController
  def index
  end

  def new
     respond_to do |format|
       format.html
       format.js
     end
  end

  def show
  end
  def create
    respond_to do |format|
      format.html
      format.js
    end
  end
end
