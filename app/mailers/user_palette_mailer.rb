class UserPaletteMailer < ApplicationMailer

  def palette_creation_email(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: @user.email, subject: "Palette created")
  end

  def palette_deletion_email(user)
    @user = user
    mail(to: @user.email, subject: "Palette deleted")
  end

end
