class Brand < ApplicationRecord
    has_many :garments

    has_many :occasions, through: 'garments'

    def occasion
        self.occasions.uniq
    end

end
