class SessionsController < ApplicationController

  def self.init_session(token)
    session[:jwt] ||= []
    session[:jwt] = token
  end

  def token
    url = request.original_url
    uri = URI::parse(url)
    url_params = CGI::parse(uri.query)
    request.headers['Authorization'] = url_params.first
    redirect_to root_path
  end

  def new 
    puts params.inspect
    debugger
  end

  def create
    puts params.inspect
    debugger
    @token = create_token(params[:data][:email])
    TokenMailer.email_token(params[:data][:email], @token[:auth_token]).deliver
    @json_msg = { status: "Token sendt", token: @token[:auth_token] }
    render json: @json_msg
  end

end
