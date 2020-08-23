class RenameColumnHoursInLaboratories < ActiveRecord::Migration[6.0]
  def change
    rename_column :laboratories, :hours, :lab_hours
  end
end