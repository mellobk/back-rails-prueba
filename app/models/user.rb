class User < ApplicationRecord
    has_many :user_proyects
    has_many :users_roles
    has_secure_password
    rolify

    validates :name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true, :phone_number => {:ten_digits => true}
    validates :email, presence: true
    validates :password_digest, presence: true
    
end
