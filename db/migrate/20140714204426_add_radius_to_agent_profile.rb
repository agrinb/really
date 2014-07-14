class AddRadiusToAgentProfile < ActiveRecord::Migration
  def change
    add_column :agent_profiles, :radius, :integer, default: 10
  end
end
