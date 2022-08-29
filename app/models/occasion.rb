class Occasion < ApplicationRecord
    has_and_belongs_to_many :garments

    has_many :brands, through: 'garments'

    validates :title, presence: true, uniqueness: true

end
