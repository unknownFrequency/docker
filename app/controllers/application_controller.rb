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
                     #session: session['jwt']['auth_token'], headers: request.headers['Authorization'] }, status: :unauthorized
      render json: { errors: 'Du skal logge ind for at se denne side.', session: session['jwt'], enc: request.headers['Authorization'] }
    else
      init_session(@encoded_token) if not session['jwt']
      #render json: { message: "Du er inde i varmen!" }, status: :authorized
    end
  end

  def session_set?
    if not session['jwt'].nil? && session['jwt']['auth_token']
      request.headers['Authorization'] = session['jwt']['auth_token']
    else
      nil
    end
  end

  def email_in_token?
    session_set? && encoded_token && auth_token
  end

  ## Use JWT from session if it's present

  def auth_token
    #TODO: Why do I have to call decode like that????
    auth_token ||= JsonWebToken.decode(encoded_token)
  end

  def create_token(email) # authenticate_user
    payload(email)
  end
  private
  def payload(email)
    return nil unless email 
    {
      auth_token: JsonWebToken.encode({ email: email })
    }
  end

  private
  def encoded_token
    @encoded_token ||= if request.headers['Authorization'].present?
      #split.last to remove "Bearer "
      request.headers['Authorization'].split(' ').last
      logger.debug session['jwt']['auth_token'].inspect
      request.headers['Authorization'] = session['jwt']['auth_token']
    else 
      nil
    end
  end
end
