class CreateApprointments < ActiveRecord::Migration
  def change
    create_table :approintments do |t|
      t.integer :agent_profile_id
      t.integer :property_id, null: false
      t.string :instructions
      t.string :visitor, null: false
      t.string :visitor_phone, null: false
      t.string :vistor_email
      t.datetime :meeting, null: false

      t.timestamps
    end
  end
end


