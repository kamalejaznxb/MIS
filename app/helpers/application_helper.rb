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

  def add_new_email_account(f)

    fields = f.simple_fields_for :email_accounts, :child_index => "new_email_account" do |builder|
      email_address = builder.input :email_address , :label => "Email Address"
      email_account_category = builder.collection_select :email_account_category_id, EmailAccountCategory.all, :id, :name
      hidden_field = builder.input :_destroy, :as => :hidden, :input_html => { :value => "" }
      email_address + email_account_category + hidden_field + link_to_remove_email_account
    end
    
    link_to "Add New E-Mail Account", "#", :remote => true, :onclick => "add_new_email_account('#new_email_accounts_container', '#{escape_javascript(fields)}')"
  end

  def link_to_remove_email_account
    link_to "Remove", "#", :remote => true, :onclick => "jQuery(this).prev('input[type=hidden]').val('1'); jQuery(this).parent().hide();"
  end
  
end
