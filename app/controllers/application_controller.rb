class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  protected
  #This is an before_action being called from home_view
  def authenticate_request! 
    if not email_in_token?
      render json: { errors: 'Her skal du ikke være!!' }, status: :unauthorized
    else
      render json: { message: "Du er inde i varmen!" }, status: :authorized
    end

    rescue JWT::VerificationError, JWT::DecodeError
  end

  def email_in_token?
    http_token && auth_token
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    #TODO: Why do I have to call decode like that????
    @auth_token ||= ApplicationController::decode(http_token)
  end

  def create_token(email) # authenticate_user
    encoded_auth_token = payload(email)
  end

  private
  def payload(email)
    return nil unless email 
    {
      #TODO: Add expiring to token eg. 1.month.from_now
      auth_token: JsonWebToken.encode({ email: email })
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
