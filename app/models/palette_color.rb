class PaletteColor < ApplicationRecord
  belongs_to :color
  belongs_to :palette
  validates_uniqueness_of :color_id, scope: :palette_id

  #validates :color_id, :palette_id, presence: true
end