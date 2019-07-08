class CreatePalettesColors < ActiveRecord::Migration[5.2]
  def change
    create_table :palettes_colors do |t|
      t.belongs_to :palette
      t.belongs_to :color
    end
  end
end
