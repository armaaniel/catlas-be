class RemoveAddressFromUsersTable < ActiveRecord::Migration[8.0]
  def change
    remove_column(:users,:address,:string)
  end
end