class AddFieldToAgentProfiles < ActiveRecord::Migration
  def change
    add_column :agent_profiles, :realty, :string
  end
end
