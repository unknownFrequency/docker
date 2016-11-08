class ApplicationController < ActionController::Base
  ## TODO: should be set to something including 'null'
  #protect_from_forgery with: :exception
  
  protected
  #This is an before_action being called from home_view
  def authenticate_request! 
    unless user_id_in_token?
      render json: { errors: ['Her skal du ikke være!!'] }, status: :unauthorized
    end

    rescue JWT::VerificationError, JWT::DecodeError
    #render json: { errors: ['Not Authenticated']  }, status: :unauthorized
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
      render json: { message: ['http_token sat!']  }
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
