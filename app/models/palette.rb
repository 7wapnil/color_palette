# frozen_string_literal: true

class Palette < ApplicationRecord
  belongs_to :user
  has_many :palette_colors
  has_many :colors, through: :palette_colors
  accepts_nested_attributes_for :palette_colors

  before_save :downcase_name

  after_save do
    UserPaletteMailer.palette_creation_email(user).deliver_later
  end

  after_destroy do
    UserPaletteMailer.palette_deletion_email(user).deliver_later
  end

  validates :name,
            presence: true,
            length: { in: 3..25 },
            uniqueness: { case_sensitive: false }
end
