class User < ApplicationRecord

    validates :name, length: { minimum: 2 }

    validates :email, presence: true, uniqueness: true

    has_secure_password

    has_many :collocations

end
