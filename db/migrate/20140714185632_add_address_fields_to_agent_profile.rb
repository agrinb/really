class AddAddressFieldsToAgentProfile < ActiveRecord::Migration
  def change
    add_column :agent_profiles, :address, :string
    add_column :agent_profiles, :city, :string
    add_column :agent_profiles, :state, :string
  end
end
