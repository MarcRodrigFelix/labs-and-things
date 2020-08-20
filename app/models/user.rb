class User < ApplicationRecord
  has_many :appointments
  has_many :laboratories, through: :appointments
end
