class SessionsController < ApplicationController
  #respond_to :html, :json

  def self.init_session(token)
    session[:jwt] ||= []
    session[:jwt] = token
  end

  def token
    url = request.original_url
    uri = URI::parse(url)
    url_params = CGI::parse(uri.query)
    request.headers['Authorization'] = url_params.first
  end

  def new 
    render component: 'EmailForm', tag: 'div'
  end

  def create
    token = params[:data][:email].present? ? create_token(params[:data][:email]) : nil
    if token && TokenMailer.email_token(params[:data][:email], token[:auth_token]).deliver
      render json: { status: "Token sendt", token: token[:auth_token] }
    else 
      render json: { status: "Noget gik galt..." }
    end
  end

end
