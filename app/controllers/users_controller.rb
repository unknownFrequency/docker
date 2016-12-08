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
    puts logger.debug(user_params.inspect)
    if User.find_by_email(user_params[:email]) 
      redirect_to edit_user_path([:email])
    end
    redirect_to galleries_path ? @user.save : flash[:warning] = "Vi kunne ikke gemme din bruger i databasen"
  end

  def index
    respond_with @user if @user
  end

  def edit
    render component: 'UserForm', 
      props: {
        authenticity_token: form_authenticity_token,
        jwt: session['jwt'],
        email: get_email
    }

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
