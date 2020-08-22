class ChangeColumnNameInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :date_of_birth, :birthdate
  end
end
