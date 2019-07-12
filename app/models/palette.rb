class Palette < ApplicationRecord
  belongs_to :user
  has_many :palette_colors
  has_many :colors, through: :palette_colors
  #has_and_belongs_to_many :colors
  accepts_nested_attributes_for :palette_colors

  before_save :downcase_name

  validates :name, presence: true,
            length: { in: 3..25 },
            uniqueness: { case_sensitive: false }       
end