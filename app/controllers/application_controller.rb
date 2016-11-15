class ApplicationController < ActionController::Base
  respond_to :html, :json
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

  def authenticate_user()
    user_id = JSON.parse(@user.id.to_s)
    encoded_auth_token = payload(user_id)
    #json: ActiveSupport::JSON.decode(encoded_auth_token)
  end

  private
  def payload(user_id)
    return nil unless user_id 
    {
      auth_token: JsonWebToken.encode({ user_id: user_id })
      #user: {email: email}
    }
  end
end
