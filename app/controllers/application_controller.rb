class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def init_session(token)
    session[:jwt] ||= []
    session[:jwt] = token
  end

  protected
  #This is an before_action being called from home_view
  def authenticate_request! 
    if not token_set_and_valid?
                     #session: session['jwt']['auth_token'], headers: request.headers['Authorization'] }, status: :unauthorized
      render json: { errors: 'Du skal logge ind for at se denne side.' }
    else
      init_session(@encoded_token) if not session['jwt']
      #render json: { message: "Du er inde i varmen!" }, status: :authorized
    end
  end

  def get_email
    if session['jwt'] && session['jwt']['auth_token']
      payload = JSON.parse(Base64.decode64(session['jwt']['auth_token'].split('.')[1]))
      payload['email']
    end
  end


  def session_set?
    if session['jwt'] && session['jwt']['auth_token']
      request.headers['Authorization'] = session['jwt']['auth_token']
    end
  end

  def token_set_and_valid?
    if not session_set?
      encoded_token && auth_token
    else 
      true
    end
  end

  ## Use JWT from session if it's present

  def auth_token
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
    else 
      nil
    end
  end
end
