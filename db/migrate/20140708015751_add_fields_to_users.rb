class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :integer
    add_column :users, :years_of_experience, :integer
    add_column :users, :description, :string
    add_column :users, :from_hour, :integer
    add_column :users, :to_hour, :integer
  end
end
