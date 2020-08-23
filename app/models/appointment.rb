class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :laboratory, optional: true

  def laboratory_attributes=(laboratory_attributes)
    if !laboratory_attributes[:name].empty?
      laboratory = Laboratory.find_or_create_by(name: laboratory_attributes[:name],lab_type: laboratory_attributes[:lab_type], phone_number: laboratory_attributes[:phone_number], address: laboratory_attributes[:address], lab_hours: laboratory_attributes[:lab_hours], days_of_operation: laboratory_attributes[:days_of_operation])
      laboratory.appointments << self
    end
  end
end
