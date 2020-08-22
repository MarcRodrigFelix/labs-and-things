class AddDateOfApptToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :appt_date, :string
  end
end
