class User < ApplicationRecord

    validates :name, length: { minimum: 2 }, uniqueness: true

    validates :email, presence: true, uniqueness: true

    has_secure_password

    has_many :collocations

    has_many :comments

    has_and_belongs_to_many :like_garments, class_name: 'Garment'

end
