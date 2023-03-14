class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    # Add a new column to the users table called admin
    add_column :users, :admin, :boolean, default: false
  end
end
