class UsersController < ApplicationController
  respond_to :html, :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      authenticate_user 

      #render json: { data: {email: @user.email, user_id: @user.id} }
      #redirect_to user_auth_path(@user, format: :json)
        #UserMailer.email_token(@user.email).deliver
        #format.html { redirect_to home_path, notice: 'Check venligst din email'  }
        #format.json { render json: @user.email }
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

  #, :username, :firstname, :lastname, :zip, :address
  def user_params
    params.require(:user).permit(:email, :address)
  end
end
