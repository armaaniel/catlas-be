class ChangeAgeToStringInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column(:users, :age, :string)
  end
end
