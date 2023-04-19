class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password_digest, presence: true, confirmation: true
    has_secure_password
end
