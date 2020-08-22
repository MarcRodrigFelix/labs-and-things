class ChangeApptTime < ActiveRecord::Migration[6.0]
  def change
    change_column :appointments, :appt_time, :string
  end
end
