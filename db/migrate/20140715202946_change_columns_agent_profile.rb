class ChangeColumnsAgentProfile < ActiveRecord::Migration
  def change
    change_column :agent_profiles, :zip_code, :string, null: true
    change_column :agent_profiles, :description, :string, null: true
    change_column :agent_profiles, :from_hour, :string, null: true
    change_column :agent_profiles, :to_hour, :string, null: true
    change_column :agent_profiles, :from_hour, :string, null: true
  end
end
