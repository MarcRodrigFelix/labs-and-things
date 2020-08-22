class Laboratory < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  accepts_nested_attributes_for :appointments, :allow_destroy => true
end
