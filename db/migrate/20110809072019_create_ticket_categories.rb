class CreateTicketCategories < ActiveRecord::Migration
  def self.up
    create_table :ticket_categories do |t|
      t.string :title
      t.integer :ticket_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_categories
  end
end
