class AddUsernameToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :username, :string
  end
end
