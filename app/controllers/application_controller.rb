class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  protected
  #This is an before_action being called from home_view
  def authenticate_request! 
    unless user_id_in_token?
      render json: { errors: 'Her skal du ikke være!!' }, status: :unauthorized
    else
      render json: { message: "Du er inde i varmen!" }, status: :authorized
    end

    rescue JWT::VerificationError, JWT::DecodeError
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= decode(http_token)
  end

  def authenticate_user()
    user_id = JSON.parse(@user.id.to_s)
    encoded_auth_token = payload(user_id)
  end

  private
  def payload(user_id)
    return nil unless user_id 
    {
      #TODO: Add expiring to token eg. 1.month.from_now
      auth_token: JsonWebToken.encode({ user_id: user_id })
    }
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end

  def self.encode(payload, exp = 1.month.from_now)
    payload[:exp] = exp
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
