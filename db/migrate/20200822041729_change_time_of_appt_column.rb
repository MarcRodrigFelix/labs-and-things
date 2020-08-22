class ChangeTimeOfApptColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :appointments, :time_of_appt, :string
  end
end
