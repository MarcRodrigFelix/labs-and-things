class FixTypeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :type, :type_of_appt
  end
end
