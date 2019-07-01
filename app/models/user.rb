class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email
  validates :name, presence: true,
            length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}+\z/i
  validates :email, presence: true, length: { maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

 private
    def downcase_email
      self.email = email.downcase         
    end
end