class SetDefaultRoleUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, default: "seller"
  end
end
