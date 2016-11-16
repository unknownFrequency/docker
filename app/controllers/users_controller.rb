class UsersController < ApplicationController

  def token
    url     = request.original_url
    puts url.inspect
    debugger
    uri     = URI.parse(url)
    #@params = CGI.parse(uri.query)
    render json: @params
  end


  ## GET
  def new
    @user = User.new
  end

  ## POST
  def create
    @user = User.new(user_params)
    if @user.save
      @token = authenticate_user()
      UserMailer.email_token(@user.email, @token[:auth_token]).deliver

      @json_msg = { status: "Token sendt", token: @token[:auth_token], user_id: @user.id }
      render json: @json_msg

      #begin
        #@parsed_response = JSON.parse(response.body)
      #rescue JSON::ParserError, TypeError => e
          #puts e
      #end
    else 
      puts @user.errors.inspect
    end

      #else
        #format.html { render 'home#index' }
        #format.json { render json: @user.errors, status: :unprocessable_entity  }
        #format.json { render json: { errors: ['Forkert Brugernavn/Password'] }, status: :unauthorized }
      #end
  end

  def index
    respond_with @user if @user
  end

  def update
  end

  def delete
  end

  def show 
    respond_with @user if @user
  end

  def user_params
    params.require(:user).permit(:email, :address,:username, :firstname, :lastname, :zip)
  end
end
