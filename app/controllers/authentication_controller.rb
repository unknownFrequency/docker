class AuthenticationController < ApplicationController
  def authenticate_user
    user_creds = ActiveSupport::JSON.decode(request.raw_post)

    if (u=user_creds['username'] && p=user_creds['password'])
      if auth_token = payload(u, p)
        respond_to do |format|
          request.headers['Authorization']
          format.json { render json: {auth_token: auth_token}, status: :created }
        end
      else
        render json: { errors: ['Noget gik galt med genereringen token'] }, status: :unauthorized
      end
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
      user: { username: username, password: password }
    }
  end

end
