class CreateAgentProfiles < ActiveRecord::Migration
  def change
    create_table :agent_profiles do |t|
      t.integer :zip_code, null: false
      t.integer :years_of_experience, null: false
      t.integer :description, null: false
      t.integer :from_hour, null: false
      t.integer :to_hour, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
