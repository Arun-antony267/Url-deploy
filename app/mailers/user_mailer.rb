class UserMailer < ApplicationMailer
  #   default from: "antonyarun481@gmail.com"

  def welcome_email(user, token)
    @user = user
    @token = token
    @url = "reset_password/token"
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end
