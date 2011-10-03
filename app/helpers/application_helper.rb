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

  def add_new_email_account(f, action)
    new_object = f.object.email_accounts.build
    fields = f.simple_fields_for :email_accounts, new_object, :child_index => "new_email_account" do |builder|
      email_address = content_tag :div, :style => "width: 350px; float: left;" do
        builder.input :email_address , :label => "Email Address", :input_html => { :style => "width: 200px;", :type => "text" }
      end
      select_tag_and_hidden_field = content_tag :div, :style => "width: 150px; float: left;" do
        email_account_category = builder.collection_select :email_account_category_id, EmailAccountCategory.all, :id, :name
        hidden_field = action == "user_email_accounts" ? "" : (builder.input :status, :as => :hidden, :input_html => { :value => "1" })
        collection_or_link = action == "user_email_accounts" ? (builder.collection_select :status, [[true, 'Enable'], [false, 'Disable']], :first, :last) : link_to_disable_email_account
        email_account_category + hidden_field + collection_or_link
      end
      email_address + select_tag_and_hidden_field
    end
    link_to "Add New E-Mail Account", "#", :remote => true, :onclick => "add_new_email_account('#new_email_accounts_container', '#{escape_javascript(fields)}')"
  end

  def link_to_disable_email_account
    link_to "Disable", "#", :remote => true, :style => "color: black; font-weight: bold;", :onclick => "jQuery(this).prev('input[type=hidden]').val('0'); jQuery(this).parent().parent().hide();"
  end
  
end
