class Garment < ApplicationRecord
    belongs_to :brand, optional: true

    has_and_belongs_to_many :occasions

    has_and_belongs_to_many :collocations

end
