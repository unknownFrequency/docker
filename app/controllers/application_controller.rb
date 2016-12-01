class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def init_session(token)
    session[:jwt] ||= []
    session[:jwt] = token
  end

  protected
  #This is an before_action being called from home_view
  def authenticate_request! 
    if not email_in_token?
      render json: { errors: 'Du skal logge ind for at se denne side.' }, status: :unauthorized
      ## TODO: Rescure when err
      #rescue JWT::VerificationError, JWT::DecodeError
    else
      init_session(@encoded_token) if not session[:jwt]
      #render json: { message: "Du er inde i varmen!" }, status: :authorized
    end
  end

  def email_in_token?
    encoded_token && auth_token
  end

  ## Use JWT from session if it's present

  def auth_token
    #TODO: Why do I have to call decode like that????
    auth_token ||= JsonWebToken.decode(encoded_token)
    logger.debug "AUTH_TOKEN::::::::::::::::::::::: #{auth_token} ::::::::::::::::::::::"
  end

  def create_token(email) # authenticate_user
    payload(email)
  end

  #def decode(token)
    #return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  #rescue
    #nil
  #end

  #def self.encode(payload, exp = 1.month.from_now)
    #payload[:exp] = exp
    #JWT.encode(payload, Rails.application.secrets.secret_key_base)
  #end

  private
  def payload(email)
    return nil unless email 
    {
      auth_token: JsonWebTok.encode({ email: email })
    }
  end

  private
  def encoded_token
    @encoded_token ||= if request.headers['Authorization'].present?
      #split.last to remove "Bearer "
      request.headers['Authorization'].split(' ').last
    elsif session[:jwt].present?
      session[:jwt]
    else 
      nil
    end
  end
end
