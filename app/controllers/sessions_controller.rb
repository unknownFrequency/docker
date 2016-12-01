class SessionsController < ApplicationController
  def index
    #redirect_to '/sessions/token'
  end

  def token
    url = request.original_url
    uri = URI::parse(url)
    url_params = CGI::parse(uri.query)
    request.headers['Authorization'] = url_params.first
    redirect_to galleries_path
    #puts url_params.first.inspect
    #email = ApplicationController::decode(url_params.first )
    #puts email.inspect
  end

  def show 
    render json: {status: "Show method puts @session: #{session[:jwt]}"}
  end

  def new 
    render component: 'EmailForm', tag: 'div'
  end

  def create
    token = params[:data][:email].present? ? create_token(params[:data][:email]) : nil
    if token && TokenMailer.email_token(params[:data][:email], token[:auth_token]).deliver && init_session(token)
      render json: { status: "Token sendt", token: token[:auth_token], headers: request.headers['Authorization'], session: session[:jwt] }
    else 
      render json: { status: "Noget gik galt..." }
    end
  end

end
