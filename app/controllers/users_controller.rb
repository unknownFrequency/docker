class UsersController < ApplicationController
  before_action :authenticate_request!, only: [:new, :create, :edit, :update, :destroy]

  ## GET
  def new
    render component: 'UserForm', 
      props: {
        authenticity_token: form_authenticity_token,
        jwt: session['jwt'],
        email: get_email
    }

    @user = User.new
  end

  ## POST
  def create
    @user = User.new(user_params)
    if @user.save
      puts session.inspect
      #render json: { status: "Token sendt", token: session['jwt']['auth_token'], user_id: @user.id }
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
