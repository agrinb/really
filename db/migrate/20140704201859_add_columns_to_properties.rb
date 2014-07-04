class AddColumnsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :user_id, :integer, null: false
    add_column :properties, :address, :string, null: false
    add_column :properties, :city, :string, null: false
    add_column :properties, :state, :string, null: false
    add_column :properties, :zip, :integer, null: false
    add_column :properties, :bedrooms, :integer, null: false
    add_column :properties, :bathrooms, :integer, null: false
    add_column :properties, :details, :string
  end
end
