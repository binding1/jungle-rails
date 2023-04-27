class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true, confirmation: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    has_secure_password

    def self.authenticate_with_credentials(email, password)
        @user = User.find_by(email: email.strip.downcase)  
        if @user && @user.authenticate(password)
          return @user
        else
          return nil
        end
    end
end
