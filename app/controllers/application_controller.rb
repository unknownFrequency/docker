class ApplicationController < ActionController::Base
  ## TODO: should be set to something including 'null'
  #protect_from_forgery with: :exception

  ALG = 'HS256'

  protected
  ## This is an before_action being called from home_view
  ## Does user have a token?
  def authenticate_request! 
    if verify_token
      @user = ActiveSupport::JSON.encode([
        username: @decoded_token[0],
        encoded_token: @http_token
      ])
    end
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    else
      nil
    end
  end

  ## TODO: Rescue / catch when tampered with
  def decode_token
    @decoded_token = JWT.decode(
                                @http_token, 
                                Rails.application.secrets.secret_key_base,
                                ALG
                               )
  end

  ## TODO: Change to uniq user_id
  def verify_token
    http_token && decode_token # && @decoded_token[:username]
    decode_token.inspect
  end
end
