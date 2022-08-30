class Photo < ApplicationRecord

    belongs_to :collocation, optional: true

end
