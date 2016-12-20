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
    redirect_to galleries_path if @user.save 
  end

  def index
    respond_with @user if @user
  end

  def edit
    render component: 'UserForm', 
      props: {
        authenticity_token: form_authenticity_token,
        jwt: session['jwt'],
        email: get_email,
        user_id: params[:id]
        ## TODO: pass method patch
    }

  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      #logger.debug(user_params)
      flash[:success] = "Profilen blev opdateret"
      respond_with user, json: user
      respond_to do |format| 
        format.html 
        format.json { render json: user }
      end
    else
      flash[:alert] = "Profilen blev IKKE opdateret"
      redirect_back(fallback_location: edit_user_path(params[:id]))
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
    params.require(:user).permit(:id, :email, :address,:username, :firstname, :lastname, :zip)
  end
end
