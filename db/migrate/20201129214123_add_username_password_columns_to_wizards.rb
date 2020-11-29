class AddUsernamePasswordColumnsToWizards < ActiveRecord::Migration[5.2]
  def change
    add_column :wizards, :username, :string
    add_column :wizards, :password, :string
  end
end
