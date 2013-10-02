class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Cadastro realizado com sucesso!"
    else
      flash[:error] = "Ocorreu um erro ao realizar o seu cadastro!"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_url, notice: "Senha alterada com sucesso!"
    else
      flash[:error] = "Ocorreu um erro ao alterar sua senha!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
