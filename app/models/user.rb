class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :palettes

  validate :valid_image_type

  has_one_attached :avatar

  private

  def valid_image_type
    if avatar.attached? && !avatar.content_type.in?("%w(image/jpeg image/png)")
      errors.add(:avatar, "Only JPEG and PNG formats are allowed.!")
    end
  end
end
