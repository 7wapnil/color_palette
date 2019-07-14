# frozen_string_literal: true

class Color < ApplicationRecord
  has_many :palette_colors
  has_many :palettes, through: :palette_colors
  before_save :downcase_name

  validates :name,
            presence: true,
            length: { in: 3..25 },
            uniqueness: { case_sensitive: false }
  validates :hex_code,
            presence: true,
            uniqueness: true
end
