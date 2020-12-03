class Wizard < ActiveRecord::Base
    has_many :student_spells, foreign_key: "student_id", class_name: "Spell"
    has_many :professor_spells, foreign_key: "professor_id", class_name: "Spell"
    belongs_to :house
    has_secure_password
end