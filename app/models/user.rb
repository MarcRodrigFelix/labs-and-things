class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, presence: true

  has_many :appointments
  has_many :laboratories, through: :appointments
end
