class CreateLaboratories < ActiveRecord::Migration[6.0]
  def change
    create_table :laboratories do |t|
      t.string :name
      t.string :type
      t.integer :phone_number
      t.string :address
      t.integer :hours
      t.string :days_of_operation

      t.timestamps
    end
  end
end
