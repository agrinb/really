class ChangeColumnTypesAgentProfiles < ActiveRecord::Migration
  def change
    change_column :agent_profiles, :from_hour, :string
    change_column :agent_profiles, :to_hour, :string
  end
end
