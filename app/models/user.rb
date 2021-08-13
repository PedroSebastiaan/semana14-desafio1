class User < ApplicationRecord
    has_secure_password
    has_many :stories, dependent: :destroy
    # attr_accessor :password_digest, :password_confirmation
    # validates :email, presence: true, uniqueness: { case_sensitive: true }
    # validates :name, presence: true
    # validates :password_digest, presence: true
    # validates :password_digest, confirmation: true
    # before_save :bcrypt_password

    # def bcrypt_password
    #     self.password_digest = BCrypt::Password.create(password)
    # end
end
