class House < ActiveRecord::Base
    has_many :wizards
    has_many :spells, through: :wizards
end