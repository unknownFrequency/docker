class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  protected
  #This is an before_action being called from home_view
  def authenticate_request! 
    unless user_id_in_token?
      render json: { errors: ['Her skal du ikke være!!'] }, status: :unauthorized
    end
    #request.headers['Authorization'] = @user.auth_token
    #rescue JWT::VerificationError, JWT::DecodeError
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
  end

  private
  def payload(user_id)
    return nil unless user_id 
    {
      auth_token: JsonWebToken.encode({ user_id: user_id })
      #user: {email: email}
    }
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end
end
