class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def not_authenticated
    redirect_to login_url, notice: "Faça o login para acessar a sua página."
  end

  protected

  def json_request?
    request.format.json?
  end
end
