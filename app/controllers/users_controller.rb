class UsersController < ApplicationController

  ## GET
  def new
    render component: 'UserForm', 
      tag: 'div', 
      authenticity_token: form_authenticity_token

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
    else 
      puts @user.errors.inspect
    end
  end

  def index
    respond_with @user if @user
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profilen blev opdateret"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Brugeren er slettet"
  end

  def show 
    respond_with @user if @user
  end

  def user_params
    params.require(:user).permit(:email, :address,:username, :firstname, :lastname, :zip)
  end
end
