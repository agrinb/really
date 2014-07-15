class ChangeColumnTypes < ActiveRecord::Migration
  def change
    change_column :agent_profiles, :zip_code, :string
    change_column :properties, :zip_code, :string
  end
end
