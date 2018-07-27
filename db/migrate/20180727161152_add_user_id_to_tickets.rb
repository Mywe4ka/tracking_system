class AddUserIdToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :customer_id, :integer unless column_exists? :tickets, :customer_id
  end

  def self.down
    remove_column :tickets, :customer_id, :integer if column_exists? :tickets, :customer_id
  end
end
