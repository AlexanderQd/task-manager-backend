class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    command = AuthenticateUser.call(session_params[:email].delete(' '), session_params[:password].delete(' '))
    render json: command.success? ? { user: command.result.first, token: command.result.last } : { errors: command.errors, status: :unauthorized }
  end

  private
  def session_params
    params.require(:authentication).permit(:email, :password, :id)
  end
end
