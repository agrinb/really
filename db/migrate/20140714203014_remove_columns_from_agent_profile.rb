class RemoveColumnsFromAgentProfile < ActiveRecord::Migration
  def change
    remove_column :agent_profiles, :address, :string
    remove_column :agent_profiles, :city, :string
    remove_column :agent_profiles, :state, :string
  end
end
