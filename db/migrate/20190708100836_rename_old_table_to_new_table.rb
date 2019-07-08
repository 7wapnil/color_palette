class RenameOldTableToNewTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :palettes_colors, :palette_colors
  end
end
