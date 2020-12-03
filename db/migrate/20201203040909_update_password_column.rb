class UpdatePasswordColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :wizards, :password, :string
    add_column  :wizards, :password_digest, :string
  end
end
