class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :laboratory, optional: true

  def laboratory_attributes=(laboratory_attributes)
    if !laboratory_attributes[:name].empty?
      laboratory = Laboratory.find_or_create_by(name: laboratory_attributes[:name])
      laboratory.appointments << self
    end
  end
end
