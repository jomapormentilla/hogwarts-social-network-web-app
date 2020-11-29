class CreateSpellsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :effect
      t.integer :student_id
      t.integer :professor_id
    end
  end
end
