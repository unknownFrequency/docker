class AuthenticationController < ApplicationController
  def authenticate_user
    user_creds = JSON.parse(request.raw_post)
    
    if (email = user_creds['email'] )
      encoded_auth_token = payload(email)
      render json: ActiveSupport::JSON.decode(encoded_auth_token)
    else
      render json: { errors: ['Forkert Brugernavn/Password'] }, status: :unauthorized
    end
  end

  private
  def payload(email)
    return nil unless username 
    {
      auth_token: JsonWebToken.encode({ email: email }),
      user: {email: email}
    }
  end
end
