class AuthenticationController < ApplicationController

  def authenticate_user
    user_creds = ActiveSupport::JSON.decode(request.raw_post)

    respond_to do |format|
      ## TODO: Do db user auth here?
      ## If username + password is correct, create auth_token
      if encoded_token = payload(user_creds['username'], user_creds['password'])
        format.json { render json: {encoded_token: encoded_token}, status: :created }
      else
        format.json { render json: { errors: ['Noget gik galt med genereringen token'] }, status: :unauthorized }
      end
    end
  end

  private
  def payload(username, password)
    return nil unless username and password
    {
      ## Also called Claims. Pass eg. ID + username + email
      ## Is 2nd in the full token header.PAYLOAD.signature (sig = HMACSHA256(payload, secret))
      ## TODO: change username to unique or use ID and remove user info?
      auth_token: JsonWebToken.encode({ username: username }),
      user: { username: username, password: password }
    }
  end

end
