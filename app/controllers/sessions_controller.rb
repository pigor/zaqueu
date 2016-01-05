class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    respond_to do |format|
      if user
        format.html {
          redirect_back_or_to root_url, :notice => "Logged in!"
        }
        format.json { render json: {status: 200, message: "Logged in", user: user.api_params} }
      else
        format.html {
          flash.now.alert = "Email ou senha inválidos."
          render :new
        }
        format.json { render json: {status: 403, message: "Email ou senha inválidos", user: user }}
      end
    end
  end

  def destroy
    logout
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out!" }
      format.json { render json: {status: 200, message: "Logged out!"} }
    end
  end
end
