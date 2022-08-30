class Collocation < ApplicationRecord

    has_and_belongs_to_many :garments

    belongs_to :user, optional: true

    validates :title, presence: true, uniqueness: true

    has_many :photos

end
