class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # Sends email to user when user is created.
        Usermailer.email_token(@user).deliver

        format.html { redirect_to 'users#index', notice: 'Check venligst din email'  }
        format.json { render :index, status: :created, location: 'users#index'  }
      else
        format.html { render :new  }
        format.json { render json: @user.errors, status: :unprocessable_entity  }
      end
      end
              
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
    params.require(:user).permit(:email, :username, :firstname, :lastname, :zip, :address)
  end
end
