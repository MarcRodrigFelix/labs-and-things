class ChangePhoneNumberColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :laboratories, :phone_number, :string
  end
end
