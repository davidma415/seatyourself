class User < ApplicationRecord
  validates :first_name, :last_name, :username, :email, :password, :password_confirmation, presence: true
  validates :username, :uniqueness => {:case_sensitive => false}

  has_secure_password
  has_many :reservations
  has_many :restaurants
end
