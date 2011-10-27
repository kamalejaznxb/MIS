class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @comment = Comment.new
    @ticket = current_user.tickets.find_by_id( params[:ticket_id] )
    respond_to do |format|
      if params.has_key?(:ticket)
        format.js{ render 'new_ticket' }
      else
        format.js
      end
    end
  end

  def create
    @comment = current_user.tickets.find_by_id(params[:ticket_id]).comments.build(params[:comment])
    @comment.user = current_user
    @comment.save
    respond_to do |format|
        format.js
    end
    
  end

end
