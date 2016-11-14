class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.email_token(@user.email).deliver
      #SendEmailJob.set(wait: 20.seconds).perform_later(@user)
      #redirect_to(@user, :notice => 'Email er sendt!')
    end

        #format.html { redirect_to 'home#index', notice: 'Check venligst din email'  }
        #format.json { render :index, status: :created, location: 'home#index'  }
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
