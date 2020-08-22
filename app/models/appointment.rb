class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory
  validates :user_id, presence: true
  validates :laboratory_id, presence: true
end
