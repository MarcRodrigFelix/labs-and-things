class FixTypeNameForLaboratories < ActiveRecord::Migration[6.0]
  def change
    rename_column :laboratories, :type, :lab_type
  end
end
