class AddMascotToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :mascot, :string
  end
end
