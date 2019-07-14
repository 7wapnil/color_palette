# frozen_string_literal: true

class PaletteColor < ApplicationRecord
  belongs_to :color
  belongs_to :palette
  validates :color_id,
            presence: true,
            uniqueness: { scope: :palette_id,
                          message: 'Pallete must have unique colors' }
end
