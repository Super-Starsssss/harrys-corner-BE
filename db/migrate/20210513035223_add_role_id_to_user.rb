class AddRoleIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :role_id, :integer
  end
end
