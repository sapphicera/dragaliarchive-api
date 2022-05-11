class RenameType < ActiveRecord::Migration[7.0]
  def change
    rename_column :characters, :type, :unit
  end
end
