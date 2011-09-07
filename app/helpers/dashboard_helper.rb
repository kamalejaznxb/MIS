module DashboardHelper
  def dashboard_count_tickets user, type, range='All'
    if range.nil?
      range ='All'
    end
    if user.eql? "All"
      if type.eql? 'All'
        if range.eql? 'All'
          Ticket.all.count
        else
          Ticket.search({'created_at_gte'=>DateCounter::count_date( range )}).all.count
        end
      else
        if range.eql? 'All'
          Ticket.search({get_ticket_eq( type ) => 'Solved'}).all.count
        else
          Ticket.search({ get_ticket_eq( type ) => 'Solved',
              'created_at_gte'=>DateCounter::count_date( range )}).all.count
        end
      end
    else
      if type.eql? 'All'
        if range.eql? 'All'
          Ticket.search({"assigned_to_eq"=>user}).all.count
        else
          Ticket.search({"assigned_to_eq"=>user,
              'created_at_gte'=>DateCounter::count_date( range )}).all.count
        end

      else
        if range.eql? 'All'
          Ticket.search({"assigned_to_eq"=> user,
              get_ticket_eq( type )=>'Solved'}).all.count
          
        else
          Ticket.search({"assigned_to_eq"=> user,
              get_ticket_eq( type )=>'Solved',
              'created_at_gte'=>DateCounter::count_date( range )
            }).all.count
        end
      end
    end
  end

  def get_data_json date
    { :technical_all => dashboard_count_tickets_graph( 'Technical', 'All', date ),
      :technical_close=> dashboard_count_tickets_graph( 'Technical', 'Closed', date ),
      :technical_open=>dashboard_count_tickets_graph( 'Technical', 'Open', date ),
      :hardware_all=>dashboard_count_tickets_graph( 'Hardware', 'All', date ),
      :hardware_close=>dashboard_count_tickets_graph('Hardware', 'Closed', date),
      :hardware_open=>dashboard_count_tickets_graph( 'Hardware', 'Open', date )
    }
  end
  def get_ticket_type type
    if type.eql? 'Technical'
      'Op'
    else
      'Hdw'
    end
  end
  def get_ticket_eq category
    if category.eql? 'Closed'
      'ticket_status_title_eq'
    else
      'ticket_status_title_ne'
    end
  end
  def dashboard_count_tickets_graph type, category, range = 'month'
    if category.eql? 'All'
      if range.eql? 'month'
        Ticket.search({'ticket_type_title_eq'=>get_ticket_type( type )}).all.count
      else
        Ticket.search({'ticket_type_title_eq'=>get_ticket_type( type ), "created_at_gte"=>range}).all.count
      end
    else
      if range.eql? 'month'
        Ticket.search({'ticket_type_title_eq'=>get_ticket_type( type ),
            get_ticket_eq( category )=>'Solved'}).all.count
      else
        Ticket.search({'ticket_type_title_eq'=>get_ticket_type( type ),
            get_ticket_eq( category )=>'Solved', "created_at_gte"=>range}).all.count
      end
    end
  end


end
