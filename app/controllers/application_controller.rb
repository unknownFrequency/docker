class ApplicationController < ActionController::Base
  ## TODO: should be set to something including 'null'
  #protect_from_forgery with: :exception
  require('json_web_token')

  protected
  ## This is an before_action being called from home_view
  ## Does user have a token?
  def authenticate_request! 
    if verify_token
      @user = ActiveSupport::JSON.encode([
        some_value: "true",
        decoded_token: @decoded_token
      ])
      render json: @user, status: :authorized
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

  def decode_token
    ## TODO: Why can't I use method from lib?????
    #@auth_token = JsonWebToken.decode(@http_token)
    @decoded_token = HashWithIndifferentAccess.new(JWT.decode(http_token, Rails.application.secrets.secret_key_base)[0])
  end

  ## TODO: Change to uniq user_id
  def verify_token
    http_token && decode_token && @decoded_token[:username]
  end
end
