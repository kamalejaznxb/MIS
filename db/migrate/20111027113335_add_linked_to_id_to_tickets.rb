class AddLinkedToIdToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :linked_to_id, :integer
  end

  def self.down
    remove_column :tickets, :linked_to_id
  end
end



