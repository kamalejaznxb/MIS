module TicketsHelper
  def check_status value
    if value == 'On Hold'
      "old leads"
    elsif value == 'New'
      "sleeping"
    elsif value == 'In Progress'
      "fell off"
    elsif value == 'Solved'
      "fullfilled"
    end
  end

  def check_filter value, type
    if type == 'Open'
      if value== 'In Progress' || value== 'New' then true end
    elsif type == 'Hold'
      if value== 'On Hold' then true end
    elsif type== 'Solved'
      if value== 'Solved' then true end
    else
      false
    end
  end
 
end

  
