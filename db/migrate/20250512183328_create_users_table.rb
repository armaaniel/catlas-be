class CreateUsersTable < ActiveRecord::Migration[8.0]
  def change
    create_table(:users) do |n|
      n.integer(:age)
      n.string(:email)
      n.string(:first_name)
      n.string(:last_name)
      n.string(:address)
      n.string(:gender)
    end
  end
end

      
    