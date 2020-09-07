class Laboratory < ApplicationRecord
  validates :name, :lab_type, :phone_number, :address, :lab_hours, :days_of_operation, presence: true
  has_many :appointments
  has_many :users, through: :appointments

  accepts_nested_attributes_for :appointments
end
