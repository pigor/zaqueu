class SessionsController < ApplicationController
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version Origin, Content-Type, Accept'
    headers['Access-Control-Max-Age'] = '1728000'
  end

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
