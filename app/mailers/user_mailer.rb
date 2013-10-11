class UserMailer < ActionMailer::Base
  default from: "no-reply@zaqueu.com.br"

  def reset_password_email(user)
    @url = edit_password_reset_url(user.reset_password_token)

    mail to: user.email, subject: "Sua senha foi reiniciada"
  end
end
