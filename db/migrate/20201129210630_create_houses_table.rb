class CreateHousesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :founder
      t.string :head_master
    end
  end
end
