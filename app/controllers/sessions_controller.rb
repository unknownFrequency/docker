class SessionsController < ApplicationController
  def index
    #redirect_to '/sessions/token'
  end

  def token
    url = request.original_url
    uri = URI::parse(url)
    url_params = CGI::parse(uri.query)
    request.headers['Authorization'] = url_params.first
    #puts logger.debug(get_email)
    email = get_email
    unless User.exists?(email: email)
      if @user = User.create!(email: email)
        flash[:notice] = "Velkommen"
        ## TODO: Change to galleries_path
        redirect_to edit_user_path(@user.id)
      else
        flash[:alert] = "Noget gik galt. Bruger ikke oprettet, men du kan stadig kigge rundt. Prøv igen"
      end
    else
      @user = User.find_by_email(email)
      redirect_to galleries_path(user_id: @user.id)
    end
    #redirect_back(fallback_location: galleries_path)
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
