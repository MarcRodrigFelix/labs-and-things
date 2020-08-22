class ChangeColumnNameInApptointments < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :time_of_appt, :appt_time
  end
end
