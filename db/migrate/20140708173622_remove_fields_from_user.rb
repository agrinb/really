class RemoveFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :zip_code, :integer
    remove_column :users, :years_of_experience, :integer
    remove_column :users, :description, :string
    remove_column :users, :from_hour, :integer
    remove_column :users, :to_hour, :integer
  end
end
