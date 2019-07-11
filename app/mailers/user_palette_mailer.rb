class UserPaletteMailer < ApplicationMailer

  def palette_creation_email(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: @user.email, subject: "Palette created")
  end

end
