class ResetPasswordController < ApplicationController
  def reset
    $email = params[:email]
    user = User.find_by(email: $email)
    $token = SecureRandom.uuid[0..4]
    if user.present?
      puts(user.name)
      UserMailer.welcome_email(user, $token).deliver_now
      flash[:message] = "Please check the mail"
      render "token"
    else
      flash[:message] = "user not found"
      render "email_check"
    end
  end

  def token_verify
    user_token = params[:token]
    if user_token == $token
      flash[:message] = "Token is correct"
      render "change_password"
    else
      flash[:message] = "Token is incorrect"
      render "email_check"
    end
  end

  def reset_password
    user = User.find_by(email: $email)
    if user.present?
      # new_password = params[:password]
      user.update(password: params[:password])
      redirect_to root_path, notice: "Password Changed"
    else
      flash[:message] = "User not present"
    end
  end
end
