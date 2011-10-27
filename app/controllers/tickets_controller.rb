class TicketsController < ApplicationController
   include UserPermission
   def index
      respond_to do |format|
         # if current_user.user_role.title.eql? "MIS"
         if current_user.can_user_do? "MIS"
            if params.has_key? :my_tasks
               @tickets = Ticket.search({'assigned_to_or_refered_to_eq'=>current_user.id}).all
               format.js{ render '/tickets/MIS/index' }
            else
               @tickets = Ticket.all
               format.html{ render '/tickets/MIS/index' }
            end
         else
            #@tickets = current_user.tickets.order('created_at DESC')
            @tickets = current_user.get_tickets
            format.html
         end
         format.js
      end

   end

   def new
      @ticket = Ticket.new
      respond_to do |format|
         format.html

         format.js
      end
   end


   def create
      @ticket = Ticket.new( params[:ticket] )
      @ticket.user = current_user
      @ticket.ip = request.remote_ip
      @ticket.save
      respond_to do |format|
         format.html{ redirect_to( tickets_path ) }
      end
   end

   def edit
      @ticket = Ticket.find_by_id( params[:id] )
      respond_to do |format|
         if params.has_key? :assign_to
            format.js{ render '/tickets/MIS/edit' }
         elsif params.has_key? :refered_to
            format.js { render '/tickets/MIS/edit_refered_to' }
         elsif params.has_key? :add_comment_and_update
            format.js { render 'add_comment_and_update' }
         else
            format.js
         end
      end
   end

   def update
      @ticket = Ticket.find( params[:id] )
      if params[:commit].eql? 'Solved'
         @ticket.update_attribute :ticket_status, TicketStatus.find_by_title( 'Solved' )
      else
         if @ticket.update_attributes( params[:ticket] )
            if (params[:ticket].has_key? :assign_to or params[:ticket].has_key? :refered_to)
               @comment = Comment.new
               @comment.ticket = @ticket
               @comment.message = params[:ticket][:comment]
               @comment.user = current_user
               @comment.save
            end
         end
      end
      respond_to do |format|
         if current_user.can_user_do? 'MIS'
            @tickets = Ticket.all
            format.js{ render '/tickets/MIS/update' }
         else
            @tickets = current_user.tickets
            format.js
         end
      end
   end

   def show
      respond_to do |format|
         if current_user.can_user_do? 'MIS'
            @ticket = Ticket.find_by_id( params[:id] )
            format.js{ render 'tickets/mis_show' }
         else
            @ticket = current_user.get_ticket( params[:id] )
            format.js
         end
      end
   end

   def filter

      respond_to do |format|
         if current_user.can_user_do? 'MIS'
            if params[:filter_type].to_s.eql? 'Users'
               @tickets = Ticket.search({"assigned_to_eq"=>params[:value]}).all
            else
               @tickets = Ticket.search({"#{params[:filter_type]}_title_eq"=>params[:value]}).all
            end

            format.js{ render '/tickets/MIS/filter' }
         else
            @tickets = current_user.tickets.search({"#{params[:filter_type]}_title_eq"=>params[:value]}).all
            format.js
         end
      end
   end
end
