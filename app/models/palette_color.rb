class PaletteColor < ApplicationRecord
  belongs_to :color
  belongs_to :palette
  validates :color_id,
            presence: true,
            uniqueness: { scope: :palette_id,
                                  message: "Pallete must have unique colors" }

  #validates :color_id, :palette_id, presence: true
end