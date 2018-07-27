class AddTypeAndPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :type, :string unless column_exists? :users, :type
    add_column :users, :password_digest, :string unless column_exists? :users, :password_digest
  end

  def self.down
    remove_column :users, :type, :string if column_exists? :users, :type
    remove_column :users, :password_digest, :string if column_exists? :users, :password_digest
  end
end
