class AuthenticationController < ApplicationController
  #def authenticate_user(email = '')
    #email = JSON.parse(request.raw_post['email']) if not email.empty?
    #encoded_auth_token = payload(email)
    #render json: ActiveSupport::JSON.decode(encoded_auth_token)
  #end

  #private
  #def payload(email)
    #return nil unless username 
    #{
      #auth_token: JsonWebToken.encode({ email: email }),
      #user: {email: email}
    #}
  #end
end
