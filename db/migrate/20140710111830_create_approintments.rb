class CreateApprointments < ActiveRecord::Migration
  def change
    create_table :approintments do |t|
      t.integer :agent_profile_id, default: null
      t.integer :user_id, null: false
      t.integer :property_id, null: false
      t.string :instructions
      t.string :visitor, null: false
      t.string :visitor_phone, null: false
      t.string :vistor_email
    end
  end
end


