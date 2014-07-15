class AddLatitudeAndLongitudeToAgentProfile < ActiveRecord::Migration
  def change
    add_column :agent_profiles, :latitude, :float
    add_column :agent_profiles, :longitude, :float
  end
end
