class Ticket < ActiveRecord::Base

    belongs_to :ticket_status
    belongs_to :ticket_type
    belongs_to :ticket_category
    belongs_to :user
    belongs_to :ticket_priority
    #  belongs_to :assigned, :class_name => "User"
    #  belongs_to :refered, :class_name=>"User"
    has_many :comments
    accepts_nested_attributes_for :comments
    has_attached_file :attachment, :styles =>
    {
        :medium => "300x300>", :thumb => "100x100>"
    }

    def assign
        self.assigned_to
    end
    def t_type
        TicketCategory.where('ticket_category_id IS NULL')
    end
    def issue
        TicketCategory.where(:ticket_category_id => 1)
    end

    def assigned
        User.find_by_id self.assigned_to
    end

    def refered
        User.find_by_id self.refered_to
    end

    def issue_type
        " "
    end
    
    def t_type=( type )
        TicketCategory.find_by_title( type ).title == "Technical" ?
        self.ticket_type = TicketType.find_by_title( "Op" ):
        self.ticket_type = TicketType.find_by_title( "Hdw" )

    end

    def issue=( issue )
        ""
    end
    def issue_type=( issue_id )
        self.ticket_category_id = issue_id
    end
    def assign_to
        ""
    end

    def assign_to=( id )
        self.assigned_to = id
    end

    def comment
        ""
    end
    def comment=( comment )

    end
    def ratings

    end
    def ratings=( rate )

    end

    def age
        d = (Date.today - self.created_at.time.to_date).to_i
        if d == 0
            'today'
        elsif d < 7
            "#{d}d"
        else
            "#{(d/7).round}w"
        end
    end

end
