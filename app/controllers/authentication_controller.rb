class AuthenticationController < ApplicationController
  def authenticate_user
    user_creds = JSON.parse(request.raw_post)
    
    if (u = user_creds['username'] && p = user_creds['password'])
      encoded_auth_token = payload(u, p)
      render json: encoded_auth_token
    else
      render json: { errors: ['Forkert Brugernavn/Password'] }, status: :unauthorized
    end
  end

  private
  def payload(username, password)
    return nil unless username and password
    {
      ## TODO: change username to unique or use ID 
      auth_token: JsonWebToken.encode({ username: username }),
      user: {username: username, password: password}
    }
  end
end
