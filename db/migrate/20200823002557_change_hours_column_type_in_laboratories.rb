class ChangeHoursColumnTypeInLaboratories < ActiveRecord::Migration[6.0]
  def change
    change_column :laboratories, :hours, :string
  end
end
