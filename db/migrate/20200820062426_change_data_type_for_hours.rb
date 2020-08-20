class ChangeDataTypeForHours < ActiveRecord::Migration[6.0]
  def up
    change_column :laboratories, :hours, :time
  end

  def down
    change_column :laboratories, :hours, :integer
  end

end
