class AuthenticationController < ApplicationController

  def authenticate_user
    user_creds = ActiveSupport::JSON.decode(request.raw_post)

    respond_to do |format|
      ## TODO: Do db user auth here?
      ## If username + password is correct, create auth_token
      if encoded_token = payload(user_creds['username'])
        format.json { render json: {encoded_token: encoded_token}, status: :created }
      else
        format.json { render json: { errors: ['Noget gik galt med genereringen token'] }, status: :unauthorized }
      end
    end
  end

  ## containing Claims. Pass eg. iss (issuer), exp (expiration time), sub(subject), aud (audience)
  ## Is 2nd in the full token header.PAYLOAD.signature (sig = HMACSHA256(payload, secret))
  ## TODO: change username to unique or use ID and remove user info?
  private
  def payload(username)
    return nil unless username
    {
      auth_token: JWT.encode(
        username,
        Rails.application.secrets.secret_key_base,
        ALG
      ),
      user: {
        username: username,
        email:    "aa@aa.aa"
      }
    }
  end

end
