class Garment < ApplicationRecord
    validates :name, presence: true

    belongs_to :brand, optional: true

    has_many :comments

    has_and_belongs_to_many :occasions

    has_and_belongs_to_many :collocations

    has_and_belongs_to_many :like_from_users, class_name: 'User'

end
