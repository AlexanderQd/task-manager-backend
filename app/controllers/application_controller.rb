class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :authenticate_request
  attr_reader :current_user

  include ExceptionHandler

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    User.current = @current_user
    render json: {errors: [{auth_error: 'Not authorized'}], status: 401} unless @current_user
  end
end