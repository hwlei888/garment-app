class Brand < ApplicationRecord
    has_many :garments

    has_many :occasions, through: 'garments'
    # get rid of the duplicate occasions
    def occasion
        self.occasions.uniq
    end

    validates :name, presence: true, uniqueness: true

end
