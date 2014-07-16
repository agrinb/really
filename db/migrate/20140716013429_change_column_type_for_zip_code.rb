class ChangeColumnTypeForZipCode < ActiveRecord::Migration
  def up
    remove_column :agent_profiles, :zip_code, :integer, default: 10
    add_column :agent_profiles, :zip_code, :string
    remove_column :agent_profiles, :radius, :integer, default: 10
    add_column :agent_profiles, :radius, :string, default: "10"


  end

   def down
    remove_column :agent_profiles, :radius, :string, default: "10"
    add_column :agent_profiles, :radius, :integer, default: 10
    remove_column :agent_profiles, :zip_code, :string
    add_column :agent_profiles, :zip_code, :integer
  end
end
