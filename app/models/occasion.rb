class Occasion < ApplicationRecord
    has_and_belongs_to_many :garments
end
