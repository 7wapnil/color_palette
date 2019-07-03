class Color < ApplicationRecord

  before_save :downcase_color_name

  validates :name, presence: true,
            length: { in: 3..25 },
            uniqueness: { case_sensitive: false }
  validates :hex_code, presence: true,
            uniqueness: true
  private

  def downcase_color_name
    self.name = name.downcase
  end
end