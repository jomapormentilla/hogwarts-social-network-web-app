class CreateWizardsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :wizards do |t|
      t.string :fname
      t.string :lname
      t.integer :house_id
    end
  end
end
