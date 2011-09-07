module ApplicationHelper
  def render_menu
    if current_user.can_user_do? 'MIS'
      "shared/mis_menu"
    else
      false
    end
  end
  
  def count_tickets type= nil, value= nil

    if current_user.can_user_do? 'MIS' then
      unless type.nil?
        if type.eql? 'Users' then
          Ticket.search({"assigned_to_eq"=>value}).all.count
        else

          Ticket.search({"#{type}_title_eq"=>value}).all.count end
      else
        Ticket.all.count
      end
    else
      unless type.nil?
        current_user.tickets.search({"#{type}_title_eq"=>value}).all.count
      else 
        current_user.tickets.count 
      end
    end

  end
  
end
