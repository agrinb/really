class ChangeZipColumnProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :zip, :integer
    add_column :properties, :zip_code, :string
  end
end
