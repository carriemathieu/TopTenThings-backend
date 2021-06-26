class User < ApplicationRecord
    has_many :lists
    has_many :categories, through: :lists
    has_secure_password

    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
end
