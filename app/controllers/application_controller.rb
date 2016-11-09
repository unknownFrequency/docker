class ApplicationController < ActionController::Base
  ## TODO: should be set to something including 'null'
  #protect_from_forgery with: :exception
  
  protected
  #This is an before_action being called from home_view
  #rescue JWT::VerificationError, JWT::DecodeError
  #
  def authenticate_request! 
    if user_id_in_token?
      render json: { message: ['LOGGET IND IND IND']  }, status: :authorized
    end
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  ## TODO: Change to uniq user_id
  def user_id_in_token?
    http_token && auth_token && auth_token[:username]
  end
end
