class RemoveColumnFromAgentProfile < ActiveRecord::Migration
  def change
    remove_column :agent_profiles, :years_of_experience, :integer
  end
end
