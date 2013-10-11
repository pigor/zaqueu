class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    @user = User.find_by_email(params.require(:email))

    if @user
      @user.deliver_reset_password_instructions!

      redirect_to login_path, notice: "As instruções para você recuperar sua senha foram enviadas para o seu email."
    else
      redirect_to login_path, alert: "Esse email não está cadastrado."
    end
  end

  def edit
    @user = User.load_from_reset_password_token(params.require(:id))

    if @user.blank?
      not_authenticated
      return
    end
  end
end