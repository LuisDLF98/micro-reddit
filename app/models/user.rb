class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments

    validates :name, 
        presence: true, 
        length: { in: 2..20, too_long: "Username should be at most 20 characters long.", too_short: "Username should be at least 2 characters long." },
        uniqueness: { message: "Username is already taken" },
        format: { with: /\A^([a-zA-Z\d]+)$\z/, message: "Username cannot contain whitespace or special characters." }

    validates :password, 
        presence: true, 
        length: { in: 6..20, too_long: "Password should be at most 20 characters long.", too_short: "Password should be at least 6 characters long." },
        uniqueness: { message: "Password is already taken." },
        format: { with: /\A^([^\s]+)$\z/, message: "Password cannot contain whitespace." },
        confirmation: true
end
