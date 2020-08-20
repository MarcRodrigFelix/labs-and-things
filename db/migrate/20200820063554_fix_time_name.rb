class FixTimeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :time, :time_of_appt
  end
end
