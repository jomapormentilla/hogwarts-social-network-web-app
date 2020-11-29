class Spell < ActiveRecord::Base
    belongs_to :student, class_name: "Wizard"
    belongs_to :professor, class_name: "Wizard"
end